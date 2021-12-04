(* Semantic checking for the MicroC compiler *)

open Ast
open Sast

module StringMap = Map.Make(String)


(*  duplicate names binds is the vdecl  *)

let check(globals,functions) =

  let check_binds (kind : string) (binds : vdecl list) =
    List.iter (function
    (Vdecl(([Void],b), (_))) -> raise (Failure ("illegal void " ^ kind ^ " " ^ b))
      | _ -> ()) binds;
    let rec dups = function
        [] -> ()
      | ((Vdecl((_,n1), _)):: (Vdecl((_,n2),_)) :: _) when n1 = n2 ->
    raise (Failure ("duplicate " ^ kind ^ " " ^ n1))
      | _ :: t -> dups t
    in dups (List.sort (fun (Vdecl((_,a), _)) (Vdecl((_,b), _)) -> compare a b) binds)
  in

(* add built in functions to symbol table *)
  let built_in_decls =
    let add_bind map (name, ty) = StringMap.add name {
      (* would be a singleton typ_list with sole Void element *)
      typ_name = [Void];
      fname = name;
      formals = [(ty, "x")];
      locals = [];
      body = [] } map
    in List.fold_left add_bind StringMap.empty [ ("printint", [Int]);
                                                 ("printf", [Float]);
                                                 ("printstr", [String]); ]
  in
(* add user defined func declarations to symbol table,  *)
(* add make sure there are no duplicate function names! *)
  let add_func map fd =
    let built_in_err = "function " ^ fd.fname ^ " may not be defined"
    and dup_err = "duplicate function " ^ fd.fname
    and make_err er = raise (Failure er)
    and n = fd.fname (* Name of the function *)
     in match fd with (* No duplicate functions or redefinitions of built-ins *)
         _ when StringMap.mem n built_in_decls -> make_err built_in_err
       | _ when StringMap.mem n map -> make_err dup_err
       | _ -> StringMap.add n fd map
    in
  let function_decls = List.fold_left add_func built_in_decls functions 
  in
  
  (* make sure a main function is defined *)
  let find_func s =
    try StringMap.find s function_decls
    with Not_found -> raise (Failure ("unrecognized function " ^ s)) in
  
  let _ = find_func "main" in (* Ensure "main" is defined *)

  (* Define rules for the type checking *)
  
  (* rule for checking/transforming an expr AST node *)
  let rec check_expr = function
      FunCall (fname,args) ->
      let theFunc = find_func fname in
      (theFunc.typ_name, SFunCall(fname, (List.map check_expr args)))
    | String_lit str -> ([String], SString_lit str)
    | Int_lit num -> ([Int], SInt_lit num)
    | Float_lit flt -> ([Float], SFloat_lit flt)
    | _ -> raise (Failure ("can't type check this expression")) in

  (* rule for checking/transforming a Vdecl AST node *)
  let check_local (Vdecl (binding,e)) = SVdecl (binding, check_expr e) in

  (* rule for checking/transforming a statement node *)
  let check_stmt = function
      Expr e -> SExpr (check_expr e)
    | Return e -> SReturn (check_expr e)
    | Continue -> SContinue
    | Break -> SBreak
    | _ -> raise (Failure ("can't type check this statement")) in

  (* rule for checking/transforming an function AST node *)
  let typeCheck_func func = {
                   styp_name = func.typ_name;
                   sfname = func.fname;
                   sformals = func.formals;
                   slocals = List.map check_local func.locals;
                   sbody = List.map check_stmt func.body;
  } in

  (* rule for type checking the global vars *)
  let typeCheck_global (Vdecl(binding, expression)) = SVdecl(binding,check_expr expression) 
  in

  (* map the typeCheck_func over all the functions*)
  (List.map typeCheck_global globals, List.map typeCheck_func functions);
 
 let check_functions func =
    check_binds "formal" (List.map (fun (a,b) -> Vdecl((a,b),Noexpr)) func.formals);
    check_binds "local" func.locals;

    (* Raise an exception if the given rvalue type cannot be assigned to
       the given lvalue type *)
    let check_assign lvaluet rvaluet err =
       if lvaluet = rvaluet then lvaluet else raise (Failure err)
    in   

    (* Build local symbol table of variables for this function *)
    let symbols = List.fold_left (fun m (Vdecl((ty, name), _)) -> StringMap.add name ty m)
	                StringMap.empty (globals @ (List.map (fun (a,b) -> Vdecl((a,b),Noexpr)) func.formals) @ func.locals )
    in

    (* Return a variable from our local symbol table *)
    let type_of_identifier s =
      try StringMap.find s symbols
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    (* Return a semantically-checked expression, i.e., with a type *)

    let rec expr = function
      FunCall (fname,args) ->
      let theFunc = find_func fname in
      (theFunc.typ_name, SFunCall(fname, (List.map check_expr args)))
    | String_lit str -> ([String], SString_lit str)
    | Int_lit num -> ([Int], SInt_lit num)
    | Float_lit flt -> ([Float], SFloat_lit flt)
    | Assign(var, op, e) as ex -> 
          let (lt, e'') = expr var
          and (rt, e') = expr e in
          let err = "illegal assignment " ^ string_of_typ lt ^ " = " ^ 
            string_of_typ rt ^ " in " ^ string_of_expr ex
          in (check_assign lt rt err, SAssign((lt, e''), op, (rt, e')))
    | _ -> raise (Failure ("can't type check this expression"))
    | Unop(op, e) as ex ->                                      (*Only Neg and Not are handles here*)
        let (t, e') = expr e in
        let ty = match op with
          Neg when t = [Int] || t = [Float] -> t
        | Not when t = [Bool] -> [Bool]
        | _ -> raise (Failure ("illegal unary operator " ^ 
                                string_of_uop op ^ string_of_typ t ^
                                " in " ^ string_of_expr ex))
        in (ty, SUnop(op, (t, e')))
    | Binop(e1, op, e2) as e -> 
        let (t1, e1') = expr e1 
        and (t2, e2') = expr e2 in
        (* All binary operators require operands of the same type *)
        let same = t1 = t2 in
        (* Determine expression type based on operator and operand types *)
        let ty = match op with
          Add | Sub | Mul | Div when same && t1 = [Int]  -> [Int]
        | Add | Sub | Mul | Div when same && t1 = [Float] -> [Float]
        | CompEq | CompNeq        when same               -> [Bool]
        | CompLeq | CompLt | CompGeq | CompGt
                    when same && (t1 = [Int] || t1 = [Float]) -> [Bool]
        | And | Or when same && t1 = [Bool] -> [Bool]
        | Concat   when same && t1 = [String] -> [String]
        | RShift | LShift | BitAnd | BitOr | Xor
                    when same && t1 = [String] -> [String]
        | _ -> raise (
      Failure ("illegal binary operator " ^
                      string_of_typ t1 ^ " " ^ string_of_op op ^ " " ^
                      string_of_typ t2 ^ " in " ^ string_of_expr e))
        in (ty, SBinop((t1, e1'), op, (t2, e2')))
  in
    let check_bool_expr e = 
      let (t', e') = expr e
      and err = "expected Boolean expression in " ^ string_of_expr e
      in if t' != [Bool] then raise (Failure err) else (t', e') 
    in
      
    (* Return a semantically-checked statement i.e. containing sexprs *)
     let rec check_stmt = function
        Expr e -> SExpr (expr e)
      | If(p, b1) -> SIf(check_bool_expr p, check_stmt b1)
      | If_Else(b1, b2) -> SIf_Else(check_stmt b1, check_stmt b2)
      (*| If_Elif(b1, b2, b3) -> SIf_Elif(check_stmt b1, check_stmt b2, check_stmt_list b3) *)
      (*|If_Elif_Else(b1, b2, b3, b4) -> SIf_Elif_Else()*)
      | For(e1, e2, e3, st) ->
	  SFor(expr e1, check_bool_expr e2, expr e3, check_stmt st)
      | While(p, s) -> SWhile(check_bool_expr p, check_stmt s)
      | Return e -> let (t, e') = expr e in
        if t = func.typ_name then SReturn (t, e') 
        else raise (
	  Failure ("return gives " ^ string_of_typ t ^ " expected " ^
		   string_of_typ func.typ_name ^ " in " ^ string_of_expr e))
	    
	    (* A block is correct if each statement is correct and nothing
	       follows any Return statement.  Nested blocks are flattened. *)
      | Block sl -> 
          let rec check_stmt_list = function
              [Return _ as s] -> [check_stmt s]
            | Return _ :: _   -> raise (Failure "nothing may follow a return")
            | Block sl :: ss  -> check_stmt_list (sl @ ss) (* Flatten blocks *)
            | s :: ss         -> check_stmt s :: check_stmt_list ss
            | []              -> []
          in SBlock(check_stmt_list sl)

    in (* body of check_function *)
    { styp_name = func.typ_name;
      sfname = func.fname;
      sformals = func.formals;
      slocals  = List.map check_local func.locals;
      sbody = match check_stmt (Block func.body) with
	SBlock(sl) -> sl
      | _ -> raise (Failure ("internal error: block didn't become a block?"))
    }
  in (typeCheck_global globals, List.map check_function functions)