(* Semantic checking for the MicroC compiler *)

open Ast
open Sast

module StdLib = Pervasives
module StringMap = Map.Make(struct
type t = string
let compare x y = StdLib.compare x y
end)

module ScopeHash = Hashtbl.Make(struct
type t = int (* type of keys *)
let equal x y = x = y (* use structural comparison *)
let hash = Hashtbl.hash (* generic hash function *)
end)

module StringHash = Hashtbl.Make(struct
type t = string (* type of keys *)
let equal x y = x = y (* use structural comparison *)
let hash = Hashtbl.hash (* generic hash function *)
end)



(* Define a data structure to keep track of scope and var bindings       *)
(*                                                                       *)
let scope = let scopeStack = (ScopeHash.create 50) in
            let aNewScope = (StringHash.create 50) in
            ignore(ScopeHash.add scopeStack  0 aNewScope);scopeStack

let max_binding tbl =
  let asList = (ScopeHash.fold (fun kn dn acc -> (kn,dn)::acc) tbl []) in
  List.fold_left (fun acc (k,_) -> StdLib.max acc k) 0 asList
let enterScope tbl =
  let num = max_binding tbl in
  ScopeHash.add tbl (num+1) (StringHash.create 50)
let addVar tbl typs id =
  let num = max_binding tbl in
    let curScope = ScopeHash.find tbl num in
    if (StringHash.mem curScope id)
    then raise (Failure ("a variable named "^id^" was already defined in this scope"))
    else (StringHash.add curScope id typs)

let rec findVar tbl id =
  let num = (max_binding tbl) in
    let curScope = (ScopeHash.find tbl num) in
    if (StringHash.mem curScope id)
    then (StringHash.find curScope id)
    else
      let containingScope = ScopeHash.copy tbl in
        ignore(ScopeHash.remove containingScope num);
        if (ScopeHash.length containingScope == 0) then []
        else findVar containingScope id
let exitScope tbl =
  let num = max_binding tbl in
  ScopeHash.remove tbl num

let print_scope tbl =
  let asScopeList = (ScopeHash.fold (fun kn dn acc -> (kn,dn)::acc) tbl []) in
  let printBind nm typs acc = acc^" ("^nm^")," in
  let printBindings s = StringHash.fold printBind s "" in
  let asBindList = List.map (fun (k,v)-> printBindings v) asScopeList in
  List.fold_left (fun a acc -> a^acc) "" asBindList
(*                                                                       *)
(* _____________________________________________________________________ *)

let check(globals, functions) =

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

(* add built in functions to symbol table*)
  let built_in_decls =
    let add_bind map (name, ty) = StringMap.add name {
      (* would be a singleton typ_list with sole Void element *)
      typ_name = [Void];
      fname = name;
      formals = [(ty, "x")];
      locals = [];
      body = [] } map
    in List.fold_left add_bind StringMap.empty [ ("printint", [Void]);
                                                 ("printb", [Void]);
                                                 ("printf", [Void]);
                                                 ("printstr", [Void]);
                                                 ("testMakeStruct", [Void]) ]
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

  let function_decls = List.fold_left add_func built_in_decls functions in

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
    | Bool_lit bl -> ([Bool],SBool_lit bl)
    | Int_lit num -> ([Int], SInt_lit num)
    | Float_lit flt -> ([Float], SFloat_lit flt)
    | Noexpr -> ([],SNoexpr)
    | Id str -> let result = (findVar scope str) in
                  (match (result) with
                   [] -> raise (Failure ("Semant: Could not find identifier "^str^" in tbl "^(print_scope scope)))
                   | typs -> (typs,(SId str))  )
    | Unop(op, e) as ex ->
      let (t, e') = check_expr e in
      let ty = match op with
      Neg when t = [Int] || t = [Float] -> t
      | Not when t = [Bool] -> [Bool]
      | BitNot when t = [Int] -> [Int]
      | _ -> raise (Failure ("illegal unary operator " ^
      string_of_uop op ^ string_of_typ_name t ^
      " in " ^ string_of_expr ex))
      in (ty, SUnop(op, (t, e')))
    | Assign (e1, op, e2) as ex->
        let lhs = check_expr e1
        and rhs = check_expr e2 in
        if ((fst lhs) = (fst rhs))
        then (fst lhs, SAssign (lhs, op, rhs))
        else raise (Failure ("type of  " ^ string_of_typ_name (fst lhs) ^
                             " does not match type " ^ string_of_typ_name (fst rhs) ^
                             " in " ^ string_of_expr ex))
    | Binop(e1, op, e2) as e ->
        let (t1, e1') = check_expr e1
        and (t2, e2') = check_expr e2 in
        (* All binary operators require operands of the same type *)
        let same = t1 = t2 in
        (* Determine expression type based on operator and operand types *)
        let ty = match op with
          Add | Sub | Mul | Div when same && t1 = [Int]  -> [Int]
        | Add | Sub | Mul | Div when same && t1 = [Float] -> [Float]
        | CompEq | CompNeq        when same               -> [Bool]
        | CompLeq | CompLt | CompGeq | CompGt
                    when same && (t1 = [Int] || t1 = [Float]) -> [Bool]
        | BitAnd | BitOr when same && t1 = [Int] -> [Int]
        | Concat   when same && t1 = [String] -> [String]      (*the LRM doesn't have this, do we need this?*)
        | RShift | LShift | BitAnd | BitOr | Xor
                    when same && t1 = [Int] -> [Int]
        | _ -> raise (
      Failure ("illegal binary operator " ^
                      string_of_typ (List.hd t1) ^ " " ^ string_of_op op ^ " " ^
                      string_of_typ (List.hd t2) ^ " in " ^ string_of_expr e))
        in (ty, SBinop((t1, e1'), op, (t2, e2')))
    | _ -> raise (Failure ("can't type check this expression")) in

  (* rule for type checking the global var *)
  let typeCheck_global (Vdecl((typs,nm)as binding, expression)) =
    let svdecl = SVdecl(binding,check_expr expression) in
    if List.mem Void typs
    then raise (Failure ("Void is not a valid type"))
    else (addVar scope typs nm ); svdecl
  in

  (* rule for checking/transforming a local var *)
  let check_local (Vdecl((typs,nm)as binding,e)) =
    let svdecl = SVdecl (binding, check_expr e) in
    if List.mem Void typs
    then raise (Failure ("Void is not a valid type"))
  else (addVar scope typs nm); svdecl
  in

  (* rule for checking formal parameter *)
  let check_formal ((typs,nm)as binding) =
    if List.mem Void typs
    then raise (Failure ("Void is not a valid type"))
    else addVar scope typs nm ; binding
  in

  (* extract local vars that were declared and initialized in the same line*)
  let check_for_init_local (Vdecl((typs,nm)as binding,e)) = match e with
     Noexpr -> None
    | init -> Some (typs,SAssign((typs,SId nm),Equal,check_expr init))

  in

  let check_bool_expr e =
      let (t', e') = check_expr e
      and err = "expected Boolean expression in " ^ string_of_expr e
      in if t' != [Bool] then raise (Failure err) else (t', e')
    in

  (* rule for checking/transforming a statement node *)
  let rec check_stmt = function
      Expr e -> SExpr (check_expr e)
    | Return e -> SReturn (check_expr e)    (*this does not check the return type of the function*)
    | Continue -> SContinue
    | Break -> SBreak
    | For(e1, e2, e3, st) ->
	        SFor(check_expr e1, check_bool_expr e2, check_expr e3, check_stmt st)
    | While(p, s) ->
          SWhile(check_bool_expr p, check_stmt s)
    | Block sl ->
      let rec check_stmt_list = function
          [Return _ as s] -> [check_stmt s]
        | Return _ :: _   -> raise (Failure "nothing may follow a return")
        | Block sl :: ss  -> check_stmt_list (sl @ ss) (* Flatten blocks *)
        | s :: ss         -> check_stmt s :: check_stmt_list ss
        | []              -> []
      in SBlock(check_stmt_list sl)
    | _ -> raise (Failure ("can't type check this statement")) in

  (* rule for checking/transforming an function AST node *)
  let typeCheck_func func =
    let checkedFormals = List.map check_formal func.formals in
    let checkedLocals = List.map check_local func.locals in
    let initLocals = List.map (fun (Some a) -> SExpr a)
                    ( List.filter (fun a -> match a with None -> false |_->true)
                    (List.map check_for_init_local func.locals) )
    in
    (* add initialization of locals to front of body *)
    let checkedBody = initLocals @(List.map check_stmt func.body) in
    {
            styp_name = func.typ_name;
            sfname = func.fname;
            sformals = checkedFormals;
            slocals = checkedLocals;
            sbody = checkedBody;
    }
  in
  (* typecheck globals before any functions *)
  let checkedGlobals = List.map typeCheck_global (List.rev globals) in

  (* map the typeCheck_func over all the functions*)
(checkedGlobals, List.map typeCheck_func functions)




(*

(*take in ast root representing our program and return
a dummy SAST node that simply contains the AST root node and a string*)

let check (globals, functions) =
  (*
  let built_in_decls =
    let add_bind map (name, ty) = StringMap.add name {
      (* would be a singleton typ_list with sole Void element *)
      typ_name = [Void];
      fname = name;
      formals = [(ty, "x")];
      locals = [];
      body = [] } map
    in List.fold_left add_bind StringMap.empty [ ("print", [Int]);
                                                 ("printstr", [String]); ]in

*)
  (* Add function name to symbol table *)
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

  (* Collect all function names into one symbol table *)
  (* this adds functions to built_in_decls function list and returns combined
  function list now*)
  let function_decls = List.fold_left add_func built_in_decls functions in

  (* Return a function from our symbol table *)
  let find_func s =
    try StringMap.find s function_decls
    with Not_found -> raise (Failure ("unrecognized function " ^ s)) in

  let _ = find_func "main" in (* Ensure "main" is defined *)

 *)