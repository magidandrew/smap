type binary_op = Add | Sub | Mul | Div | Concat | CompEq | CompLt | CompLeq | CompGt | CompNeq | CompGeq | And | Or | RShift | LShift | BitAnd | BitOr | Xor
type unary_op = BitNot | Not | Bang | Octothorpe | Neg
type assign_op = PlusEqual | MinusEqual | TimesEqual | DivEqual | Equal

type typ = Int | Bool | Float | Void | Char | String | Prob | List
type typ_name = typ list

type bind = typ_name * string

type expr =
    Binop of expr * binary_op * expr
|   Unop of unary_op * expr
|   Assign of expr * assign_op * expr
|   Int_lit of int
|   Bool_lit of bool
|   Float_lit of float
|   Char_lit of char
|   String_lit of string
|   List_lit of expr list
|   Id of string
|   Cast of typ_name * expr
|   ListElement of string * expr * expr list
|   ListAddHead of expr * expr
|   ListAddTail of expr * expr
|   Length of expr
|   ProbColon of expr * expr
|   FunCall of string * expr list
|   Index of expr
|   Noexpr 

type vdecl =
  Vdecl of bind * expr

let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mul -> "*"
  | Div -> "/"
  | Concat -> "++"
  | CompEq -> "=="
  | CompLt -> "<"
  | CompNeq -> "!="
  | CompLeq -> "<="
  | CompGt -> ">"
  | CompGeq -> ">="
  | And -> "&&"
  | Or -> "||"
  | RShift -> ">>"
  | LShift -> "<<"
  | BitAnd -> "&"
  | BitOr -> "|"
  | Xor -> "^"

let string_of_uop = function
    BitNot -> "~"
  | Not -> "!"
  | Octothorpe -> "#"
  (*| Neg -> "-"*)

let string_of_assign = function
    PlusEqual -> "+="
  | MinusEqual -> "-="
  | TimesEqual -> "*="
  | DivEqual -> "/="
  | Equal -> "="

let rec string_of_expr = function
    Int_lit(l) -> string_of_int l
  | Float_lit(l) -> string_of_float l    (*check floats again*)
  | Bool_lit(true) -> "true"
  | Bool_lit(false) -> "false"
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, o, e) -> string_of_expr v ^ " " ^ string_of_assign o ^ " " ^ string_of_expr e
  | FunCall(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""

let string_of_typ = function
    [Int] -> "int"
  | [Bool] -> "bool"
  | [Float] -> "float"
  | [Void] -> "void"
  | [Char] -> "char"
  | [String] -> "string"
  | [Prob] -> "prob"
  | [List] -> "list"

type stmt = Block of stmt list
| Expr of expr
| Return of expr
| If of expr * stmt
| If_Else of stmt * stmt
| If_Elif of stmt * stmt * stmt list
| If_Elif_Else of stmt * stmt * stmt list * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt
| Break
| Continue
| Elif of expr * stmt (*only use inside an if statement, never alone!*)

type func_decl = { typ_name : typ_name;
                   fname : string;
                   formals : bind list;
                   locals : vdecl list;
                   body : stmt list;
                 }

type program = vdecl list * func_decl list

(* dummy pretty printer*)
(*                 (vars, funcs)                              *)
let string_of_program (_,_) = "someday I'll pretty print the AST! \n"