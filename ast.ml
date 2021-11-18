type binary_op = Add | Sub | Mul | Div | Concat | CompEq | CompLt | CompLeq | CompGt | CompNeq | RShift | LShift | BitAnd | BitOr | Xor
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
|   ListElement of string * index list
|   ListAddHead of string * expr
|   ListAddTail of string * expr
|   Length of expr
|   ProbColon of expr * expr
|   FunCall of string * expr list
|   Noexpr

type index = expr

type vdecl =
  Vdecl of bind * expr

type stmt = Block of stmt list
| Expr of expr
| Assign_stmt of assign_expr
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
let string_of_program (vars, funcs) = "I don't do anything useful yet\n"