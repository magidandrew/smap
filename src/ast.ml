type binary_op = Add | Sub | Mul | Div | Concat | CompEq | CompGeq | CompLt | CompLeq | CompGt | CompNeq | RShift | LShift | BitAnd | BitOr | Xor
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

type stmt =
  Block of stmt list
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

let string_of_uop = function
  Neg -> "-"
| Not -> "!"
| BitNot -> "~"
| Bang -> "!"
| Octothorpe -> "#"

let string_of_typ = function
  Int -> "Int"
| Bool -> "Bool"
| Float -> "Float"
| Char -> "Char"
| String -> "String"
| List -> "List"
| Void -> "Void"
| Prob -> "Prob"


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
  | RShift -> ">>"
  | LShift -> "<<"
  | BitAnd -> "&"
  | BitOr -> "|"
  | Xor -> "^"

let string_of_assign = function
    PlusEqual -> "+="
  | MinusEqual -> "-="
  | TimesEqual -> "*="
  | DivEqual -> "/="
  | Equal -> "="

(* !NON EXHUASTIVE PATTERN MATCHING! *)
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

(* !NON EXHUASTIVE PATTERN MATCHING! *)
let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
  (*| If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2*)
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s

let string_of_typ_name typ_lst =
  List.fold_left (fun acc elt -> acc^elt^" ") "" (List.map string_of_typ typ_lst)