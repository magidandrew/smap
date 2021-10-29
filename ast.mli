type operator = Add | Sub | Mul | Div

type expr =
    Binop of expr * operator * expr
    | Lit of int
    | Litvar of string
    | Assign of string * expr
    | Sequence of expr * expr
    | Cond of expr * expr * expr

