(* Code generation: translate takes a semantically checked AST and
produces LLVM IR

LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)

module L = Llvm
module A = Ast
open Sast

module StringMap = Map.Make(String)
(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context = L.global_context () in

  (* Create the LLVM compilation module into which we will generate code *)
  let the_module = L.create_module context "Smap" in

  let i32_t = L.i32_type context (* 32 bit integer *)
  and i8_t = L.i8_type context   (* 8 bit integer *)
  and i1_t = L.i1_type context   (* 1 bit integer *)
  and str = L.pointer_type (L.i8_type context)
  and float_t = L.double_type context
  and dummy_t = L.struct_type context [|L.pointer_type (L.i8_type context);(L.i32_type context)|]
  and void_t = L.void_type context in
  (* Return the LLVM type for a MicroC type *)
  let ltype_of_typ = function
    A.Int -> i32_t
  | A.Char -> i8_t
  | A.Bool -> i1_t
  | A.Float -> float_t
  | A.Void -> void_t
  | A.String -> str
  | A.Prob -> dummy_t
  | _ -> void_t (*add in prob, string, and list types later! *)
  in

  (* Create a map of global variables after creating each *)
  let global_vars : L.llvalue StringMap.t =
  let global_var m (SVdecl((t, n),exp)) =
  let simpleType = List.hd t in (*just use head of type list for now *)
  let init = match simpleType with (* add more types in this pattern match! *)
     A.Float -> (match exp with 
                 (_,SFloat_lit v) -> L.const_float (ltype_of_typ simpleType) v
                 | _ ->  L.const_float (ltype_of_typ simpleType) 0.0)
    | A.Int -> (match exp with 
                 (_, SInt_lit v) -> L.const_int (ltype_of_typ simpleType) v
                 |_ ->  L.const_int(ltype_of_typ simpleType) 0)
    | _ -> L.const_int (ltype_of_typ simpleType) 0
  in StringMap.add n (L.define_global n init the_module) m in
  List.fold_left global_var StringMap.empty globals in

  (* declare built in C functions *)
  let printstr_t: L.lltype = L.function_type i32_t [| L.pointer_type i8_t |] in
  let printstr_func : L.llvalue = L.declare_function "printstr" printstr_t the_module in

  let printb_t: L.lltype = L.function_type i32_t [| i1_t |] in
  let printb_func : L.llvalue = L.declare_function "printb" printb_t the_module in
  
  let testMakeStruct_t: L.lltype = L.function_type dummy_t [| L.pointer_type i8_t;i32_t |] in
  let testMakeStruct_func : L.llvalue = L.declare_function "testMakeStruct" testMakeStruct_t the_module in

  let printint_t: L.lltype = L.function_type i32_t [| i32_t |] in
  let printint_func : L.llvalue = L.declare_function "printint" printint_t the_module in

  let printf_t : L.lltype = L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue = L.declare_function "printf" printf_t the_module in

  (* Define each function (arguments and return type) so we can 
  call it even before we’ve created its body *)
  let function_decls : (L.llvalue * sfunc_decl) StringMap.t =
  let function_decl m fdecl =
  let name = fdecl.sfname
  and formal_types = Array.of_list (List.map (fun (t,_) -> ltype_of_typ (List.hd t)) fdecl.sformals) in
  let simpleReturnType = List.hd fdecl.styp_name in
  let ftype = L.function_type (ltype_of_typ simpleReturnType) formal_types in
  StringMap.add name (L.define_function name ftype the_module, fdecl) m in
  List.fold_left function_decl StringMap.empty functions in
  (* ... *)
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) =
    StringMap.find fdecl.sfname function_decls in
    let builder =
    L.builder_at_end context (L.entry_block the_function) in
    let test_str =
      L.build_global_stringptr "test test test!\n" "test" builder in
    let int_format_str =
    L.build_global_stringptr "%d\n" "fmt" builder
    and float_format_str =
    L.build_global_stringptr "%f\n" "fmt" builder in

  (*
   let global_vars : L.llvalue StringMap.t =
  let global_var m (SVdecl((t, n),exp)) =
  let simpleType = List.hd t in (*just use head of type list for now *)
  let init = match simpleType with (* add more types in this pattern match! *)
     A.Float -> (match exp with 
                 (_,SFloat_lit v) -> L.const_float (ltype_of_typ simpleType) v
                 | _ ->  L.const_float (ltype_of_typ simpleType) 0.0)
    | A.Int -> (match exp with 
                 (_, SInt_lit v) -> L.const_int (ltype_of_typ simpleType) v
                 |_ ->  L.const_int(ltype_of_typ simpleType) 0)
    | _ -> L.const_int (ltype_of_typ simpleType) 0
  in StringMap.add n (L.define_global n init the_module) m in
  List.fold_left global_var StringMap.empty globals in
  
  
  *)

  let local_vars =
    let add_formal m (t, n) p = L.set_value_name n p;
    let simpleType = List.hd t in
    let local = L.build_alloca (ltype_of_typ simpleType) n builder in 
    ignore (L.build_store p local builder);
    StringMap.add n local m
    and add_local m (SVdecl((t, n),exp)) = (* need to add in initializing locals!!! *)
    let simpleType2 = List.hd t in
    let local_var = L.build_alloca (ltype_of_typ simpleType2) n builder in 
    StringMap.add n local_var m in
    let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals (Array.to_list (L.params the_function)) in
    List.fold_left add_local formals fdecl.slocals in 

  (* Return the value for a variable or formal argument. Check local names first, then global names *)
  let lookup n = try StringMap.find n local_vars with 
                     Not_found -> StringMap.find n global_vars in

  let rec expr builder ((_, e) : sexpr) = match e with
    SInt_lit i
    -> L.const_int i32_t i
    | SString_lit s
    -> L.build_global_stringptr s "the_str" builder
    | SBool_lit b
    -> L.const_int i1_t (if b then 1 else 0)
    | SFloat_lit l
    -> L.const_float float_t l
    | SNoexpr
    -> L.const_int i32_t 0
    | SId s
    -> L.build_load (lookup s) s builder
    | SUnop(op, ((t, _) as e)) 
    -> let e' = expr builder e in (match op with
        A.Neg when t = [A.Float] -> L.build_fneg
        | A.Neg
        -> L.build_neg
        | A.BitNot
        -> L.build_not
        | A.Not
        -> L.build_not) e' "tmp" builder
    | SAssign (e1, op, e2)
    -> let e1' = (match e1 with (_,SId nm) -> lookup nm | _ -> raise (Failure("assignments to exprs dont work yet")))
       and e2' = expr builder e2 in
       (match op with (*PlusEqual | MinusEqual | TimesEqual | DivEqual | Equal*)
          PlusEqual -> raise (Failure("special assignments need binops to be able to work"))
        | MinusEqual -> raise (Failure("special assignments need binops to be able to work"))
        | TimesEqual -> raise (Failure("special assignments need binops to be able to work"))
        | DivEqual -> raise (Failure("special assignments need binops to be able to work"))
        | Equal -> ignore(L.build_store e2' e1' builder); e1')
    | SFunCall ("printint", [e]) 
    -> L.build_call printint_func [| (expr builder e) |]
       "printint" builder
    | SFunCall ("testMakeStruct",[(_,theSExpr) as arg]) 
    -> (match theSExpr with
        SInt_lit _
        -> L.build_call testMakeStruct_func [| test_str; expr builder arg |]
            "testMakeStruct" builder
        | _ 
        -> L.build_call printb_func [| (expr builder arg) |]
            "printb" builder)
    | SFunCall ("printb", [e]) ->
        L.build_call printb_func [| (expr builder e) |]
        "printb" builder
    | SFunCall ("printstr", [e]) ->
      L.build_call printstr_func [| (expr builder e) |]
      "printstr" builder
    | SFunCall ("printf", [e]) ->
      L.build_call printf_func [| float_format_str ; (expr builder e) |]
      "printf" builder  
    | SFunCall (f, args) ->
       let (fdef, fdecl) = StringMap.find f function_decls in
       let llargs = List.rev (List.map (expr builder) (List.rev args)) in
       let result = (match (List.hd fdecl.styp_name) with
       A.Void -> ""
       | _ -> f ^ "_result") in
       L.build_call fdef (Array.of_list llargs) result builder
    in

  let add_terminal builder f =
    match L.block_terminator (L.insertion_block builder) with
    Some _ -> ()
    | None -> ignore (f builder) in
  
  let rec stmt builder = function
    SBlock sl -> List.fold_left stmt builder sl
    | SExpr e -> ignore(expr builder e); builder
    | SReturn e -> ignore(match (List.hd fdecl.styp_name) with
                                           (* Special "return nothing" instr *)
                                           A.Void -> L.build_ret_void builder
                                           (* Build return statement *)
    | _ -> L.build_ret (expr builder e) builder ); builder  
  in 

  (* Build the code for each statement in the function *)
  let builder = stmt builder (SBlock fdecl.sbody) in
  (* Add a return if the last block falls off the end *)
  add_terminal builder (match (List.hd fdecl.styp_name) with
  A.Void -> L.build_ret_void
  | A.Float -> L.build_ret (L.const_float float_t 0.0)
  | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  (* ... *)

  in
  List.iter build_function_body functions;
  the_module

 

 (*(* <= un comment this line to see the old microc semantic analyzer with nice colors*)
(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in
  (* Create the LLVM compilation module into which
     we will generate code *)
  let the_module = L.create_module context "MicroC" in
  (* Get types from the context *)
  let i32_t      = L.i32_type    context
  and i8_t       = L.i8_type     context
  and i1_t       = L.i1_type     context
  and float_t    = L.double_type context
  and void_t     = L.void_type   context in
  (* Return the LLVM type for a MicroC type *)
  let ltype_of_typ = function
      A.Int   -> i32_t
    | A.Bool  -> i1_t
    | A.Float -> float_t
    | A.Void  -> void_t
  in
  (* Create a map of global variables after creating each *)
  let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n) =
      let init = match t with
          A.Float -> L.const_float (ltype_of_typ t) 0.0
        | _ -> L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in
  let printf_t : L.lltype =
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue =
      L.declare_function "printf" printf_t the_module in
  let printbig_t : L.lltype =
      L.function_type i32_t [| i32_t |] in
  let printbig_func : L.llvalue =
      L.declare_function "printbig" printbig_t the_module in
  (* Define each function (arguments and return type) so we can
     call it even before we've created its body *)
  let function_decls : (L.llvalue * sfunc_decl) StringMap.t =
    let function_decl m fdecl =
      let name = fdecl.sfname
      and formal_types =
	Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.sformals)
      in let ftype = L.function_type (ltype_of_typ fdecl.styp) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in
    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder
    and float_format_str = L.build_global_stringptr "%g\n" "fmt" builder in
    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p =
        L.set_value_name n p;
	let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore (L.build_store p local builder);
	StringMap.add n local m
      (* Allocate space for any locally declared variables and add the
       * resulting registers to our map *)
      and add_local m (t, n) =
	let local_var = L.build_alloca (ltype_of_typ t) n builder
	in StringMap.add n local_var m
      in
      let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.slocals
    in
    (* Return the value for a variable or formal argument.
       Check local names first, then global names *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars
    in
    (* Construct code for an expression; return its value *)
    let rec expr builder ((_, e) : sexpr) = match e with
	SLiteral i  -> L.const_int i32_t i
      | SBoolLit b  -> L.const_int i1_t (if b then 1 else 0)
      | SFliteral l -> L.const_float_of_string float_t l
      | SNoexpr     -> L.const_int i32_t 0
      | SId s       -> L.build_load (lookup s) s builder
      | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'
      | SBinop ((A.Float,_ ) as e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
	  (match op with
	    A.Add     -> L.build_fadd
	  | A.Sub     -> L.build_fsub
	  | A.Mult    -> L.build_fmul
	  | A.Div     -> L.build_fdiv
	  | A.Equal   -> L.build_fcmp L.Fcmp.Oeq
	  | A.Neq     -> L.build_fcmp L.Fcmp.One
	  | A.Less    -> L.build_fcmp L.Fcmp.Olt
	  | A.Leq     -> L.build_fcmp L.Fcmp.Ole
	  | A.Greater -> L.build_fcmp L.Fcmp.Ogt
	  | A.Geq     -> L.build_fcmp L.Fcmp.Oge
	  | A.And | A.Or ->
	      raise (Failure "internal error: semant should have rejected and/or on float")
	  ) e1' e2' "tmp" builder
      | SBinop (e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
	  (match op with
	    A.Add     -> L.build_add
	  | A.Sub     -> L.build_sub
	  | A.Mult    -> L.build_mul
          | A.Div     -> L.build_sdiv
	  | A.And     -> L.build_and
	  | A.Or      -> L.build_or
	  | A.Equal   -> L.build_icmp L.Icmp.Eq
	  | A.Neq     -> L.build_icmp L.Icmp.Ne
	  | A.Less    -> L.build_icmp L.Icmp.Slt
	  | A.Leq     -> L.build_icmp L.Icmp.Sle
	  | A.Greater -> L.build_icmp L.Icmp.Sgt
	  | A.Geq     -> L.build_icmp L.Icmp.Sge
	  ) e1' e2' "tmp" builder
      | SUnop(op, ((t, _) as e)) ->
          let e' = expr builder e in
	  (match op with
	    A.Neg when t = A.Float -> L.build_fneg
	  | A.Neg                  -> L.build_neg
          | A.Not                  -> L.build_not) e' "tmp" builder
      | SCall ("print", [e]) | SCall ("printb", [e]) ->
	  L.build_call printf_func [| int_format_str ; (expr builder e) |]
	    "printf" builder
      | SCall ("printbig", [e]) ->
	  L.build_call printbig_func [| (expr builder e) |] "printbig" builder
      | SCall ("printf", [e]) ->
	  L.build_call printf_func [| float_format_str ; (expr builder e) |]
	    "printf" builder
      | SCall (f, args) ->
         let (fdef, fdecl) = StringMap.find f function_decls in
	 let llargs = List.rev (List.map (expr builder) (List.rev args)) in
	 let result = (match fdecl.styp with
                        A.Void -> ""
                      | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list llargs) result builder
    in
    (* LLVM insists each basic block end with exactly one "terminator"
       instruction that transfers control.  This function runs "instr builder"
       if the current block does not already have a terminator.  Used,
       e.g., to handle the "fall off the end of the function" case. *)
    let add_terminal builder instr =
      match L.block_terminator (L.insertion_block builder) with
	Some _ -> ()
      | None -> ignore (instr builder) in
    (* Build the code for the given statement; return the builder for
       the statement's successor (i.e., the next instruction will be built
       after the one generated by this call) *)
    let rec stmt builder = function
	SBlock sl -> List.fold_left stmt builder sl
      | SExpr e -> ignore(expr builder e); builder
      | SReturn e -> ignore(match fdecl.styp with
                              (* Special "return nothing" instr *)
                              A.Void -> L.build_ret_void builder
                              (* Build return statement *)
                            | _ -> L.build_ret (expr builder e) builder );
                     builder
      | SIf (predicate, then_stmt, else_stmt) ->
         let bool_val = expr builder predicate in
	 let merge_bb = L.append_block context "merge" the_function in
         let build_br_merge = L.build_br merge_bb in (* partial function *)
	 let then_bb = L.append_block context "then" the_function in
	 add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
	   build_br_merge;
	 let else_bb = L.append_block context "else" the_function in
	 add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
	   build_br_merge;
	 ignore(L.build_cond_br bool_val then_bb else_bb builder);
	 L.builder_at_end context merge_bb
      | SWhile (predicate, body) ->
	  let pred_bb = L.append_block context "while" the_function in
	  ignore(L.build_br pred_bb builder);
	  let body_bb = L.append_block context "while_body" the_function in
	  add_terminal (stmt (L.builder_at_end context body_bb) body)
	    (L.build_br pred_bb);
	  let pred_builder = L.builder_at_end context pred_bb in
	  let bool_val = expr pred_builder predicate in
	  let merge_bb = L.append_block context "merge" the_function in
	  ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
	  L.builder_at_end context merge_bb
      (* Implement for loops as while loops *)
      | SFor (e1, e2, e3, body) -> stmt builder
	    ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
    in
    (* Build the code for each statement in the function *)
    let builder = stmt builder (SBlock fdecl.sbody) in
    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.styp with
        A.Void -> L.build_ret_void
      | A.Float -> L.build_ret (L.const_float float_t 0.0)
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in
  List.iter build_function_body functions;
  the_module
*)