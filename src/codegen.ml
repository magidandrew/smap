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

  (*
  For reference - delete before committing!!!
  typedef struct list{
    void **data;
    int capacity;
    int size;
  } list;

  typedef struct prob {
    list probs;
    list vals;
    int length;
} prob;
*)

  let i32_t = L.i32_type context (* 32 bit integer *)
  and i8_t = L.i8_type context   (* 8 bit integer *)
  and i1_t = L.i1_type context   (* 1 bit integer *)
  and str = L.pointer_type (L.i8_type context)
  and float_t = L.double_type context
  and void_t = L.void_type context
  in
  let dummy_t = L.struct_type context [|str; i32_t;|]
  in
  let list_t : L.lltype = L.named_struct_type context "list"
  in
  let prob_t : L.lltype = L.named_struct_type context "prob"
  in
  (* Return the LLVM type for a MicroC type *)
  let ltype_of_typ = function
    A.Int -> i32_t
  | A.Char -> i8_t
  | A.Bool -> i1_t
  | A.Float -> float_t
  | A.Void -> void_t
  | A.String -> str
  | A.Prob -> L.pointer_type prob_t (*need to change to prob_t eventually*)
  | A.List -> L.pointer_type list_t
  | _ -> void_t (*add in prob, string, and list types later! *)
  in

  (*make sure to include struct definitions for the llvm struct types named earlier*)
  let _ =
    L.struct_set_body list_t
    	[| L.pointer_type (L.pointer_type i8_t)
      ; i32_t
      ; i32_t |] false;
  L.struct_set_body prob_t
	  [| list_t
		; list_t
    ; i32_t |] false;
  in

  (* for reference
  SFunCall ("printint", [e])
    -> L.build_call printint_func [| (expr builder e) |]
       "printint" builder
  *)
  let genGlobalListLit (typlist,exp) n m =
    let defaultZero =
      let zero = L.const_int i32_t 0 in
      L.const_named_struct list_t [|zero; zero; zero|]
    in
    let wholeThing = (match exp with
      (SList_lit(inits))
      -> (match inits with
          ([A.Int],SInt_lit(v))::rest -> let one = L.const_int i32_t 1 in
                                    L.const_named_struct list_t [|one; one; one|]
          | _ -> let zero = L.const_int i32_t 0 in
                  L.const_named_struct list_t [|zero; zero; zero|])
      | _ -> defaultZero)
    in StringMap.add n (L.define_global n wholeThing the_module) m
  in

  (* Create a map of global variables after creating each *)
  let global_vars : L.llvalue StringMap.t =
  let global_var m (SVdecl((t, n),exp)) =
  let simpleType = List.hd t in (*just use head of type list for now *)
  match simpleType with
     A.List
     -> genGlobalListLit exp n m
    | _
     -> let init = (match simpleType with (* add more types in this pattern match! *)
                        A.Float
                        -> (match exp with
                              (_,SFloat_lit v)
                              -> L.const_float (ltype_of_typ simpleType) v
                              | _
                              ->  L.const_float (ltype_of_typ simpleType) 0.0)
                        | A.Int
                        -> (match exp with
                              (_, SInt_lit v)
                              -> L.const_int (ltype_of_typ simpleType) v
                              |_
                              ->  L.const_int(ltype_of_typ simpleType) 0)
                        (*TODO: change this to actually work with prob type!!!*)
                        | A.Prob
                        -> L.const_int i32_t 0
                        | _
                        -> L.const_int i32_t 0)
        in StringMap.add n (L.define_global n init the_module) m in
  List.fold_left global_var StringMap.empty globals in

  (* declare built in C functions *)
  let printstr_t: L.lltype = L.function_type i32_t [| L.pointer_type i8_t |] in
  let printstr_func : L.llvalue = L.declare_function "printstr" printstr_t the_module in

  let printb_t: L.lltype = L.function_type i32_t [| i1_t |] in
  let printb_func : L.llvalue = L.declare_function "printb" printb_t the_module in

  let stringLength_t: L.lltype = L.function_type i32_t [| L.pointer_type i8_t |] in
  let stringLength_func: L.llvalue = L.declare_function "stringLength" stringLength_t the_module in

  let corresponding_int_t: L.lltype = L.function_type i32_t [| L.pointer_type i8_t;i32_t |] in
  let corresponding_int_func: L.llvalue = L.declare_function "corresponding_int" corresponding_int_t the_module in

  let testMakeStruct_t: L.lltype = L.function_type dummy_t [| L.pointer_type i8_t;i32_t |] in
  let testMakeStruct_func : L.llvalue = L.declare_function "testMakeStruct" testMakeStruct_t the_module in

  let printint_t: L.lltype = L.function_type i32_t [| i32_t |] in
  let printint_func : L.llvalue = L.declare_function "printint" printint_t the_module in

  let printf_t : L.lltype = L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue = L.declare_function "printf" printf_t the_module in

  let push_back_t : L.lltype = L.var_arg_function_type i32_t [|L.pointer_type list_t; L.pointer_type i8_t|] in
  let push_back_func : L.llvalue = L.declare_function "push_back" push_back_t the_module in

  let init_list_t : L.lltype = L.var_arg_function_type i32_t [|L.pointer_type list_t|] in
  let init_list_func : L.llvalue = L.declare_function "init_list" init_list_t the_module in

  let init_prob_t : L.lltype = L.var_arg_function_type i32_t [|L.pointer_type prob_t; 
                                                               L.pointer_type list_t; 
                                                               L.pointer_type list_t|] in
  let init_prob_func : L.llvalue = L.declare_function "init_prob" init_prob_t the_module in

  let peek_t : L.lltype = L.var_arg_function_type (L.pointer_type i8_t) [|L.pointer_type prob_t|] in
  let peek_func : L.llvalue = L.declare_function "peek" peek_t the_module in
  
  let list_length_t : L.lltype = L.var_arg_function_type i32_t [|L.pointer_type list_t|] in
  let list_length_func : L.llvalue = L.declare_function "list_length" list_length_t the_module in

  let modulus_operation_t: L.lltype = L.var_arg_function_type i32_t [|i32_t;i32_t|] in
  let modulus_operation_func : L.llvalue = L.declare_function "modulus_operation" modulus_operation_t the_module in

  let get_length_t :L.lltype = L.var_arg_function_type i32_t [|L.pointer_type prob_t|] in
  let get_length_func : L.llvalue = L.declare_function "get_length" get_length_t the_module in

  let get_at_t : L.lltype = L.var_arg_function_type (L.pointer_type i8_t) [|L.pointer_type list_t; i32_t|] in
  let get_at_func : L.llvalue = L.declare_function "get_at" get_at_t the_module in

  let set_at_t : L.lltype = L.var_arg_function_type (L.pointer_type list_t) [|L.pointer_type list_t; i32_t; L.pointer_type i8_t|] in
  let set_at_func : L.llvalue = L.declare_function "set_at" set_at_t the_module in

  let print_list_int_t : L.lltype = L.var_arg_function_type i32_t [|L.pointer_type list_t|] in
  let print_list_int_func : L.llvalue = L.declare_function "print_list_int" print_list_int_t the_module in

  let print_list_float_t : L.lltype = L.var_arg_function_type i32_t [|L.pointer_type list_t|] in
  let print_list_float_func : L.llvalue = L.declare_function "print_list_float" print_list_float_t the_module in

(*list *get_vals(prob *p) { return &p->vals; }*)
  let get_vals_t : L.lltype = L.var_arg_function_type (L.pointer_type list_t) [|L.pointer_type prob_t|] in
  let get_vals_func : L.llvalue = L.declare_function "get_vals" get_vals_t the_module in

  let get_probs_t : L.lltype = L.var_arg_function_type (L.pointer_type list_t) [|L.pointer_type prob_t|] in
  let get_probs_func : L.llvalue = L.declare_function "get_probs" get_probs_t the_module in

  let print_prob_int_debug_t : L.lltype = L.var_arg_function_type i32_t [|L.pointer_type prob_t|] in
  let print_prob_int_debug_func : L.llvalue = L.declare_function "print_prob_int_debug" print_prob_int_debug_t the_module in

  let bad_add_head_t : L.lltype = L.var_arg_function_type i32_t [| L.pointer_type list_t; L.pointer_type i8_t |] in
  let bad_add_head_func : L.llvalue = L.declare_function "bad_add_head" bad_add_head_t the_module in

  let very_bad_get_head_t : L.lltype = L.var_arg_function_type i32_t [| L.pointer_type list_t|] in
  let very_bad_get_head_func : L.llvalue = L.declare_function "very_bad_get_head" very_bad_get_head_t the_module in

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
    let newLine_str = 
      L.build_global_stringptr "\n" "newLine" builder in
    let int_format_str =
    L.build_global_stringptr "%d" "fmt" builder
    and float_format_str =
    L.build_global_stringptr "%f" "fmt" builder in

  let local_vars =
    let add_formal m (t, n) p = (* add formal parameters to scope *)
    L.set_value_name n p;
    let simpleType = List.hd t in
    let local = L.build_alloca (ltype_of_typ simpleType) n builder in
    ignore (L.build_store p local builder);
    StringMap.add n local m
    and add_local m (SVdecl((t, n),exp)) = (* add locals to scope  *)
    let simpleType2 = List.hd t in
    let local_var = L.build_alloca (ltype_of_typ simpleType2) n builder in
    StringMap.add n local_var m in
    let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals (Array.to_list (L.params the_function)) in
    List.fold_left add_local formals fdecl.slocals in

  (* Return the value for a variable or formal argument. Check local names first, then global names *)
  let lookup n = try StringMap.find n local_vars with
                     Not_found -> StringMap.find n global_vars in

  let rec expr builder ((theTyp, e) : sexpr) = 
    match e with
    SInt_lit i
    -> L.const_int i32_t i
    | SIndex i
    -> expr builder i
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
    | SLength(p)
    -> let p' = expr builder p in
      (match List.hd (fst p) with
         A.Prob 
         -> L.build_call get_length_func [| p' |]
         "get_length" builder
       | A.List 
       -> L.build_call list_length_func [| p' |]
       "list_length" builder
       |_ 
       -> raise (Failure("semant should have caught this misuse of .length!")) )
    | SListElement (listId,index,rest)
    -> let eltType = fst index in
       let theList = expr builder listId in
       let elt = L.build_call get_at_func [| theList; expr builder index|]
                 "get_at" builder in
       let eltAsPtr = match eltType with
                       [A.Int] -> L.build_bitcast elt (L.pointer_type i32_t) "eltAsPtr" builder  
                       | [A.Float] -> L.build_bitcast elt (L.pointer_type float_t) "eltAsPtr" builder
                       | [A.Char] -> raise(Failure("fill in for char"))
                       | [A.Bool] -> raise(Failure("fill in for bool"))
                       | [A.Prob] -> raise(Failure("fill in for prob someday... >.<\""))
                      in  
       let eltDeRef = L.build_load eltAsPtr "eltDeref" builder in
       eltDeRef     
    | SList_lit elts
    -> (match theTyp with
        [A.List;A.List;A.Char]
        -> raise(Failure("lists of strings aren't supported yet D: "))
        | [A.List;u] (*simple list of one type - (no lists of lists here)*)
        -> (match elts with 
            [] (*CASE: EMPTY LIST *)
            -> 
            (* get pointer to list struct *)
            let anAllocatedList = L.build_malloc list_t "listAddr" builder in
            (* initialize the list with list_init *)
            let _ =  L.build_call init_list_func [| anAllocatedList|]
            "init_list" builder
            in anAllocatedList
        | (elt::rest) (*CASE: NON-EMPTY LIST *)
        -> (*
              allocInitElt helper function
              Description:
              Allocate and intitalize a list elt, then cast to ( char * )
              For ex: int * tmp = malloc(sizeOf(int));
                      *tmp = 5;
                      char * tmp2 = ( char* ) tmp;
              After this step, ready to pass vals to the push_front function!
           *) 
          let allocInitElt v =
              (* save type of element *)
              let vtype = fst v in
              (* 5 *)
              let value = expr builder v in
              (* int * tmp *)
              let tmp = match (vtype) with
                         [A.Int] -> L.build_alloca (L.pointer_type i32_t) "tmp" builder
                         | [A.Float] -> L.build_alloca (L.pointer_type float_t) "tmp" builder
                         | [A.Char] -> raise(Failure("fill in for char"))
                         | [A.Bool] -> raise(Failure("fill in for bool"))
                         | [A.Prob] -> raise(Failure("fill in for prob someday... >.<\""))
              in
              (* malloc(sizeOf(int)) *)
              let heapAddr = match (vtype) with
                              [A.Int] -> L.build_malloc i32_t "tmpAddr" builder
                              | [A.Float] -> L.build_malloc float_t "tmpAddr" builder
                              | [A.Char] -> raise(Failure("fill in for char"))
                              | [A.Bool] -> raise(Failure("fill in for bool"))
                              | [A.Prob] -> raise(Failure("fill in for prob someday... >.<\""))
              in
              (* tmp = malloc(sizeOf(int)); *)
              let tmp' = ignore(L.build_store heapAddr tmp builder); tmp in
              (* *tmp *)
              let tmp'' = L.build_load tmp' "tmpWithVal" builder in
              (* *tmp = 5 *)
              let tmp''' = ignore (L.build_store value tmp'' builder); tmp'' in
              (* char * tmp2 = ( char* ) tmp;  *)
              let asChar = L.build_bitcast tmp''' (L.pointer_type i8_t) "asChar" builder
              in asChar
          in 
          let addElt lst c =
            L.build_call push_back_func [| lst; c |]
            "push_back" builder
          in
          (* allocate list struct *)
          let aList = L.build_alloca (L.pointer_type list_t) "theList" in
          (* get pointer to list struct *)
          let anAllocatedList = L.build_malloc list_t "listAddr" builder in
          (* initialize the list with list_init *)
          let _ =  L.build_call init_list_func [| anAllocatedList|]
          "init_list" builder in
          (* add any starting elts to the list *)
          let values = List.map allocInitElt (elt::rest)
          in
          let _ = List.map (addElt anAllocatedList) values
          (* return the pointer to the now-intialized list*)
          in anAllocatedList)        
    |_ 
    -> raise (Failure "Only support simple lists at the moment >.<\""))
    | SProbColon (lhs,rhs)
    -> let lhs' = expr builder lhs
       and rhs' = expr builder rhs in
        (* get pointer to prob struct *)
        let anAllocatedProb = L.build_malloc prob_t "probAddr" builder in
        (* initialize the prob with prob_init *)
        let _ =  L.build_call init_prob_func [| anAllocatedProb; lhs'; rhs'|]
        "init_prob" builder in
        (* let vs = L.build_call get_vals_func [| anAllocatedProb|]
        "get_vals" builder in
        let _ = L.build_call print_list_int_func [| (vs) |]
        "print_list_int" builder in *)
        anAllocatedProb
    | SUnop(op, ((t, _) as e))
    -> let e' = expr builder e in (match op with
        A.Neg when t = [A.Float] -> L.build_fneg  e' "tmp" builder
        | A.Neg 
        -> L.build_neg e' "tmp" builder
        | A.BitNot
        -> L.build_not e' "tmp" builder
        | A.Bang
        -> let cPtr = L.build_call peek_func [| e'|] "peek" builder in
           (* let vs = L.build_call get_vals_func [| e'|] "get_vals" builder in
           let cPtr = L.build_call get_at_func [|vs; L.const_int i32_t 0|] "get_at" builder in  *)
           let eltAsPtr = match theTyp with
                         [A.Int] -> L.build_bitcast cPtr (L.pointer_type i32_t) "eltAsPtr" builder  
                       | [A.Float] -> L.build_bitcast cPtr (L.pointer_type float_t) "eltAsPtr" builder
                       | [A.Char] -> L.build_bitcast cPtr (L.pointer_type i8_t) "eltAsPtr" builder
                       | [A.Bool] -> L.build_bitcast cPtr (L.pointer_type i1_t) "eltAsPtr" builder
                       | [A.List] -> L.build_bitcast cPtr (L.pointer_type list_t) "eltAsPtr" builder
                      in  
           let eltDeRef = L.build_load eltAsPtr "eltDeref" builder in
           eltDeRef  
        | A.Octothorpe
        -> L.build_call get_probs_func [| e'|] "get_probs" builder 
        | A.Not
        -> L.build_not e' "tmp" builder)
    | SBinop (([Float],_ ) as e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
	  (match op with
	    A.Add     -> L.build_fadd
	  | A.Sub     -> L.build_fsub
	  | A.Mul     -> L.build_fmul
	  | A.Div     -> L.build_fdiv
	  | A.CompNeq -> L.build_fcmp L.Fcmp.One
	  | A.CompLt  -> L.build_fcmp L.Fcmp.Olt
	  | A.CompLeq -> L.build_fcmp L.Fcmp.Ole
	  | A.CompGt  -> L.build_fcmp L.Fcmp.Ogt
	  | A.CompGeq -> L.build_fcmp L.Fcmp.Oge
	  | A.BitAnd | A.BitOr ->
	      raise (Failure "internal error: semant should have rejected and/or on float")
	  ) e1' e2' "tmp" builder
      | SBinop (e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
	  (match op with
	    A.Add     -> L.build_add
	  | A.Sub     -> L.build_sub
	  | A.Mul     -> L.build_mul
    | A.Div     -> L.build_sdiv
	  | A.BitAnd  -> L.build_and
	  | A.BitOr   -> L.build_or
	  | A.CompNeq -> L.build_icmp L.Icmp.Ne
	  | A.CompLt  -> L.build_icmp L.Icmp.Slt
	  | A.CompLeq -> L.build_icmp L.Icmp.Sle
	  | A.CompGt  -> L.build_icmp L.Icmp.Sgt
	  | A.CompGeq -> L.build_icmp L.Icmp.Sge
    | A.CompEq  -> L.build_icmp L.Icmp.Eq
    | A.RShift  -> L.build_ashr
    | A.LShift  -> L.build_lshr
    | A.Xor     -> L.build_xor
	  ) e1' e2' "tmp" builder
    | SAssign (e1, op, e2)
    -> (match e1 with
        (_,SId nm) 
        -> let e1' = lookup nm 
           and e2' = expr builder e2 in 
          (match op with (*PlusEqual | MinusEqual | TimesEqual | DivEqual | Equal*)
              PlusEqual -> raise (Failure("special assignments need binops to be able to work"))
            | MinusEqual -> raise (Failure("special assignments need binops to be able to work"))
            | TimesEqual -> raise (Failure("special assignments need binops to be able to work"))
            | DivEqual -> raise (Failure("special assignments need binops to be able to work"))
            | Equal -> ignore(L.build_store e2' e1' builder); e1')
        | (ty, SListElement (listId,index,rest))
        -> (*
              allocInitElt helper function
              Description:
              Allocate and intitalize a list elt, then cast to ( char * )
              For ex: int * tmp = malloc(sizeOf(int));
                      *tmp = 5;
                      char * tmp2 = ( char* ) tmp;
          *)  
          let allocInitElt v =
              (* save type of element *)
              let vtype = fst v in
              (* 5 *)
              let value = expr builder v in
              (* int * tmp *)
              let tmp = match (vtype) with
                        [A.Int] -> L.build_alloca (L.pointer_type i32_t) "tmp" builder
                        | [A.Float] -> L.build_alloca (L.pointer_type float_t) "tmp" builder
                        | [A.Char] -> raise(Failure("fill in for char"))
                        | [A.Bool] -> raise(Failure("fill in for bool"))
                        | [A.Prob] -> raise(Failure("fill in for prob someday... >.<\""))
              in
              (* malloc(sizeOf(int)) *)
              let heapAddr = match (vtype) with
                              [A.Int] -> L.build_malloc i32_t "tmpAddr" builder
                              | [A.Float] -> L.build_malloc float_t "tmpAddr" builder
                              | [A.Char] -> raise(Failure("fill in for char"))
                              | [A.Bool] -> raise(Failure("fill in for bool"))
                              | [A.Prob] -> raise(Failure("fill in for prob someday... >.<\""))
              in
              (* tmp = malloc(sizeOf(int)); *)
              let tmp' = ignore(L.build_store heapAddr tmp builder); tmp in
              (* *tmp *)
              let tmp'' = L.build_load tmp' "tmpWithVal" builder in
              (* *tmp = 5 *)
              let tmp''' = ignore (L.build_store value tmp'' builder); tmp'' in
              (* char * tmp2 = ( char* ) tmp;  *)
              let asChar = L.build_bitcast tmp''' (L.pointer_type i8_t) "asChar" builder
              in asChar
            in 
            let theList = expr builder listId
            and i = expr builder index
            and e2' = allocInitElt e2 in 
            let _ = L.build_call set_at_func [| theList; i; e2'|] "set_at" builder 
            in theList )         
    | SFunCall ("printint", [e])
    -> L.build_call printint_func [| (expr builder e) |]
       "printint" builder
    | SFunCall ("stringLength", [e]) ->
       L.build_call stringLength_func [| (expr builder e) |]
       "stringLength" builder
    | SFunCall ("corresponding_int", [e;e2]) ->
    L.build_call corresponding_int_func [| (expr builder e);(expr builder e2) |]
    "corresponding_int" builder
    | SFunCall ("modulus_operation", [e;e2]) ->
    L.build_call modulus_operation_func [| (expr builder e);(expr builder e2) |]
    "modulus_operation" builder
    | SFunCall ("very_bad_get_head", [e])
    -> let arg = (expr builder e) in
       L.build_call very_bad_get_head_func [| arg |]
       "very_bad_get_head" builder
    | SFunCall ("testMakeStruct",[(_,theSExpr) as arg])
    -> (match theSExpr with
        SInt_lit _
        -> L.build_call testMakeStruct_func [| test_str; expr builder arg |]
            "testMakeStruct" builder
        | _
        -> L.build_call printb_func [| (expr builder arg) |]
            "printb" builder)
    | SFunCall ("println",arg)
    -> let _ = expr builder (theTyp,SFunCall("print",arg)) in
       L.build_call printstr_func [| newLine_str |] "printstr" builder
    | SFunCall ("print",[(typeList,_) as arg])
    -> (match typeList with
        [A.Int]
        -> L.build_call printint_func [| (expr builder arg) |]
           "printint" builder
        | [A.Prob;A.Int] ->
          L.build_call print_prob_int_debug_func [| (expr builder arg) |]
           "print_prob_int_debug" builder
        | [A.Bool]
        -> L.build_call printb_func [| (expr builder arg) |]
            "printb" builder
        | [A.Float]
        -> L.build_call printf_func [| float_format_str ; (expr builder arg) |]
        "printf" builder
        | [A.String]
        -> L.build_call printstr_func [| (expr builder arg) |]
        "printstr" builder
        | [A.List; A.Int]
        -> L.build_call print_list_int_func [| (expr builder arg) |]
        "print_list_int" builder
        | [A.List; A.Float]
        -> L.build_call print_list_float_func [| (expr builder arg) |]
        "print_list_float" builder
        | _
        -> raise(Failure("printing type "^A.string_of_typ_name typeList ^ "not yet supported")))
    | SFunCall ("print_list_int", [e]) ->
        L.build_call print_list_int_func [| (expr builder e) |]
        "print_list_int" builder
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

    | SIf (p, b) ->
        let pred_bb = L.append_block context "if" the_function in
        ignore(L.build_br pred_bb builder);

        let body_bb = L.append_block context "if_body" the_function in
          let merge_bb = L.append_block context "merge" the_function in
        add_terminal (stmt (L.builder_at_end context body_bb) b)
          (L.build_br merge_bb);

        let pred_builder = L.builder_at_end context pred_bb in
        let bool_val = expr pred_builder p in

      ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
      L.builder_at_end context merge_bb

    | SIf_Else (p, b) ->
      let if_node = (match p with SIf(lhs, rhs) -> (lhs, rhs)
                  | _ -> raise(Failure("If_Else SIf block matching error"))) in

      let pred_bb = L.append_block context "if" the_function in
        ignore(L.build_br pred_bb builder);

      let body_bb = L.append_block context "if_body" the_function in
          let else_bb = L.append_block context "else_body" the_function in
            let merge_bb = L.append_block context "merge" the_function in
              add_terminal (stmt (L.builder_at_end context body_bb) (snd if_node))
                (L.build_br merge_bb);

              add_terminal (stmt (L.builder_at_end context else_bb) b)
              (L.build_br merge_bb);

        let pred_builder = L.builder_at_end context pred_bb in
          let bool_val = expr pred_builder (fst if_node) in
            ignore(L.build_cond_br bool_val body_bb else_bb pred_builder);
            L.builder_at_end context merge_bb

    | SIf_Elif(if_stmt, fst_elif, elif_lst) ->
      let if_node = (match if_stmt with
          SIf(lhs, rhs) -> (lhs, rhs)
        | _ -> raise(Failure("If_Elif SIf block matching error"))) in
      let elif_node = (match fst_elif with
          SElif(lhs, rhs) -> (lhs, rhs)
        | _ -> raise(Failure("If_Elif SElif block matching error"))) in

      let pred_bb = L.append_block context "if" the_function in
        ignore(L.build_br pred_bb builder);

      let body_bb = L.append_block context "if_body" the_function in

        let elif_pred_bb = L.append_block context "elif" the_function in

        let elif_bb = L.append_block context "elif_body" the_function in

            let merge_bb = L.append_block context "merge" the_function in

            (* if stmt body *)
              add_terminal (stmt (L.builder_at_end context body_bb) (snd if_node))
                (L.build_br merge_bb);
            (* elif conditional *)
              let pred_builder = L.builder_at_end context elif_pred_bb in
              let elif_val = expr pred_builder (fst elif_node) in
                ignore(L.build_cond_br elif_val elif_bb merge_bb pred_builder);
            (* elif stmt body *)
              add_terminal (stmt (L.builder_at_end context elif_bb) (snd elif_node))
              (L.build_br merge_bb);

      (* let rec elif_builder elifs = function
      | s :: s ->
      | [] -> None *)

  (* if conditional *)
      let pred_builder = L.builder_at_end context pred_bb in
        let bool_val = expr pred_builder (fst if_node) in
          ignore(L.build_cond_br bool_val body_bb elif_pred_bb pred_builder);

      L.builder_at_end context merge_bb

(* SIf (predicate, then_stmt, else_stmt) ->
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
	 L.builder_at_end context merge_bb *)

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