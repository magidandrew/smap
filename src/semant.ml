(* Semantic checking for the MicroC compiler *)

open Ast
open Sast

module StdLib = Stdlib
module StringMap = Map.Make(struct
type t = string
let compare x y = StdLib.compare x y
end)

(* Define a data structure to keep track of scope and var bindings       *)
(*                                                                       *)
let scope = [StringMap.empty]
let enterScope s = (StringMap.empty)::s
let addVar typ_name id s = match s with 
  (h::t) -> if (StringMap.mem id h) 
    then raise (Failure ("a variable named "^id^" was already defined in this scope"))
    else (StringMap.add id typ_name h)::t
| [] -> raise (Failure ("no scope to add an identifier to"))
let rec findVar id cur_scope = match cur_scope with 
 (h::t) -> if (StringMap.mem id h) then StringMap.find id h else findVar id t
 |_ -> []  (* returns empty list of types if identifier not present in any scopes *)
let exitScope s = match s with
  [h] -> [h] (* never get rid of the global scope *)
 | (_::t) -> t
 | [] -> raise (Failure ("tried to exit scope but there aren't any scopes left!!"))
(*                                                                       *)
(* _____________________________________________________________________ *)

let check(globals,functions) =
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
    | Id str -> raise (Failure ("can't type check this identifier "^str))
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
let typeCheck_global (Vdecl(binding, expression)) = SVdecl(binding,check_expr expression) in


  (* map the typeCheck_func over all the functions*)
(List.map typeCheck_global globals, List.map typeCheck_func functions)




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