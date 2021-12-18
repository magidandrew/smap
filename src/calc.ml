
module StringHash = Hashtbl.Make(struct
type t = string
(* type of keys *)
let equal x y = x = y
(* use structural comparison *)
let hash = Hashtbl.hash
(* generic hash function *)
end)

let bindings:(int) StringHash.t = StringHash.create 10

open Ast

let rec eval = function
    Lit(x)            -> x
  | Binop(e1, op, e2) ->
      let v1  = eval e1 in
      let v2 = eval e2 in
      (match op with
  Add -> v1 + v2
      | Sub -> v1 - v2
      | Mul -> v1 * v2
      | Div -> v1 / v2)
  | Var(x)            -> StringHash.find bindings x
  | Assign(var_id,e)  -> ignore (StringHash.add bindings var_id (eval e)); StringHash.find bindings var_id
  | Sequence(e1,e2)   -> ignore (eval e1); eval e2
  | IfElse(cond,e1,e2) -> if eval cond > 0 then eval e1 else eval e2

let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parser.expr Scanner.tokenize lexbuf in
  let result = eval expr in
  print_endline (string_of_int result)