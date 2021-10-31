(* QUESTIONS: *)
(* what do we do with stlib functions like `print`? *)

{ open Parser }

rule tokenize = parse
(* scoping *)
| '['                   { LBRACKET }
| ']'                   { RBRACKET }
| '{'                   { LBRACE }
| '}'                   { RBRACE }
| '('                   { LPAREN }
| ')'                   { RPAREN }

(* operators  *)
| '+'                   { PLUS }
| '-'                   { MINUS }
| '*'                   { TIMES }
| '/'                   { DIVIDE }
| '='                   { ASSIGN }
| "+="                  { ADDEQUAL }
| "-="                  { MINUSEQUAL }
| "*="                  { TIMESEQUAL }
| "/="                  { DIVEQUAL }
| ">>"                  { RSHIFT }
| "<<"                  { LSHIFT }


(* statement symbols *)
| ';'                   { SEMICOLON }
| ':'                   { PROBCOLON }
| ','                   { COMMA }

(* SMAP types *)
| "list"                { LIST }
| "prob"                { PROB}

(* loops *)
| "while"               { WHILE }
| "for"                 { FOR }

(* primitive types *)
| "int"                 { INT }
| "char"                { CHAR }
| "bool"                { BOOL }
| "string"              { STRING }
| "float"               { FLOAT }
| "void"                { VOID }

(* function declaration *)
| "fn"                  { FUNCTION }

(* comments *)
| "/*"                  { comment lexbuf }
| "//"                  { COMMENTLINE }

(* whitespace *)
| [' ' '\t' '\r' '\n']    { tokenize lexbuf }

(* comparison operators *)
| "=="                  { COMPEQ }
| "<"                   { COMPLT }
| "<="                  { COMPLEQ }
| '>'                   { COMPGT }
| ">="                  { COMPGEQ }
| "!="                  { COMPNEQ }
| "&&"                  { AND }
| "||"                  { OR }
| "!"                   { NOT }

(* Overlap operator*)


(* Accessor *)| "^^"                    { OVERLAP }
| '.'                     { DOT }
| "length"                { LENGTH }

(* control flow *)
| "if"                  { IF }
| "elif"                { ELIF }
| "else"                { ELSE }
| "switch"              { SWITCH }
| "case"                { CASE }
| "default"             { DEFAULT }
| "break"               { BREAK }
| "continue"            { CONTINUE }
| "return"              { RETURN }

(* literals *)
| ['0'-'9']+ as lit     { LITERAL(int_of_string lit) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as var_id  { VAR(var_id) }
| ['a'-'z' 'A'-'Z']['!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '[' ']' '{' '}' '\\' '/' '0'-'9' ',' '.' '+' '-' '*' ]* as over  { VAR(over) }

(* float literal *)
| "true"                { BLIT(true) }
| "false"               { BLIT(false) }

(* EOF *)
| eof                   { EOF }
| _ as ch               { raise (Failure("illegal character " ^ Char.escaped ch)) }

and lineComment =
  parse '\n'            { tokenize lexbuf }
  | _                   { lineComment lexbuf}

and comment =
  parse "*/"            { tokenize lexbuf }
  | _                   { comment lexbuf}