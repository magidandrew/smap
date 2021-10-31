type operator = Add | Sub | Mul | Div

type typ = Int | Bool | Float | Void | Char | String

type bind = typ * string


type expr =
    Binop of expr * expr
|   Literal of int
|   Assertassign of expr
|   Assignment of string * expr
|   Var of string
|   Noexpr
|   ShiftExec of expr * expr * expr
|   OverlapExec of expr * expr * expr
|   Endof of expr
|   Prob of typ * string
|   Blank

type stmt = Block of stmt list
| Expr of expr
| Return of expr
| If of expr * stmt * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt


type func_decl = { typ : typ; 
                   fname : string;
                   formals : bind list; 
                   locals : bind list; 
                 }