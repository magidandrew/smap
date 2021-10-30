type operator = Add | Sub | Mul | Div

type typ = Int | Bool | Float | Void | Char | String



type expr =
    Binop of expr * expr
|   Literal of int
|   Assignment of string * expr
|   Var of string
|   Noexpr
|   ShiftExec of expr
|   Endof of expr


type stmt = Block of stmt list
| Expr of expr
| Return of expr
| If of expr * stmt * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt