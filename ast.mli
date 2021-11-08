type binary_op = Add | Sub | Mul | Div | CompEq | CompLt | CompLeq | CompGt | CompNeq | RShift | LShift | BitAnd | BitOr | Xor
type unary_op = BitNot | Not | Bang | Octothorpe
type assign_op = PlusEqual | MinusEqual | TimesEqual | DivEqual | Assign

type typ = Int | Bool | Float | Void | Char | String | Prob | List
type typ_name = typ list

type bind = typ_name * string

type expr =
    Binop of expr * binary_op * expr
|   Unop of unary_op * expr
|   Int_Lit of int
|   Bool_lit of bool
|   Float_lit of float
|   Char_lit of char
|   List_lit of expr list
|   Assertassign of expr
|   Id of string
|   ListElement of string * expr
|   Noexpr
|   Blank






type assign = string * assign_op * expr

type vdecl = 
  PlainDecl of bind
| InitDecl of bind * assign

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
                   locals : vdecl list; 
                   body : stmt;
                 }

type program = vdecl list * func_decl list