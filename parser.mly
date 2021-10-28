%{ open Ast %}

%token PLUS MINUS TIMES DIVIDE EOF ASSIGN SEMICOLON IF THEN ELSE HOWDY
%token <int> LITERAL
%token <string> VAR

%left SEMICOLON
%left IF ELSE THEN
%right ASSIGN

%left PLUS MINUS
%left TIMES DIVIDE

%start expr
%type <Ast.expr> expr

%%

expr:
  expr PLUS   expr { Binop($1, Add, $3) }
| expr MINUS  expr { Binop($1, Sub, $3) }
| expr TIMES  expr { Binop($1, Mul, $3) }
| expr DIVIDE expr { Binop($1, Div, $3) }
| LITERAL          { Lit($1) }
| VAR              { Var($1) }
| VAR ASSIGN expr             { Assign($1, $3)     }
| expr SEMICOLON expr         { Sequence($1, $3)   }
| IF expr THEN expr ELSE expr { IfElse($2, $4, $6) }


