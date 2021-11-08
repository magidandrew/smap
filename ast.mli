type binary_op = Add | Sub | Mul | Div | Concat | CompEq | CompLt | CompLeq | CompGt | CompNeq | RShift | LShift | BitAnd | BitOr | Xor
type unary_op = BitNot | Not | Bang | Octothorpe | Neg
type assign_op = PlusEqual | MinusEqual | TimesEqual | DivEqual | Assign

type typ = Int | Bool | Float | Void | Char | String | Prob | List
type typ_name = typ list

type bind = typ_name * string

type expr =
    Binop of expr * binary_op * expr
|   Unop of unary_op * expr
|   Int_lit of int
|   Bool_lit of bool
|   Float_lit of float
|   Char_lit of char
|   String_lit of string
|   List_lit of expr list
|   Assertassign of expr
|   Id of string
|   ListElement of string * expr
|   Cast of typ_name * expr
|   ListRightShift of expr * expr * expr
|   ListLeftShift of expr * expr * expr
|   ListAddHead of string * expr
|   ListAddTail of string * expr
|   Length of expr
|   FunCall of string * expr list
|   Noexpr
|   Blank (*filler AST node until we make a real one*)


type probInit = expr * expr

type init = 
| Regular of expr
| Prob_Init of probInit

type assign_expr = expr * assign_op * init


type vdecl = 
  PlainDecl of bind
| InitDecl of bind * assign_expr

type stmt = Block of stmt list
| Expr of expr
| Assign_stmt of assign_expr
| Return of expr
| If of expr * stmt
| If_Else of expr * stmt * stmt
| If_Elif of expr * stmt * stmt * stmt list    (*probably shouldn't use tuples here... fix soon?*)
| If_Elif_Else of expr * stmt * stmt * stmt list * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt
| Break
| Continue
| Elif of expr * stmt (*only use inside an if statement, never alone!*)
| Dummy (*filler AST node until we make a real one*)




type func_decl = { typ_name : typ_name; 
                   fname : string;
                   formals : bind list; 
                   locals : vdecl list; 
                   body : stmt;
                 }

type program = vdecl list * func_decl list

