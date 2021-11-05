type operator = Add | Sub | Mul | Div

type typ = Int | Bool | Float | Void | Char | String | Prob| List
(*type typ_decl = WithQualifiers of typ * typ_decl | SingleType of typ*)

type typ_name = typ list

type bind = typ_name * string


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
|   Blank

type stmt = Block of stmt list
| Expr of expr
| Return of expr
| If of expr * stmt * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt
| Dummy


type func_decl = { typ_name : typ_name; 
                   fname : string;
                   formals : bind list; 
                   locals : bind list; 
                   body : stmt;
                 }

type program = bind list * func_decl list