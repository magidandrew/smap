(* QUESTIONS: *)
(* what do we do with stlib functions like `print`? *)

{ open Parser }
let letter = ['a'-'z' 'A'-'Z' ]
let digit = ['0'-'9']
let punc = ['.' ',' ':' ';' '!' '?' '-' '`' ''' '"' '(' ')' '?']
let otherChar = ['@' '#' '$' '%' '^' '&' '*' '[' ']' '{' '}' '\\' '/' '+' '-' '*' '_' '>' '<' '=']

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
| '~'                   { BITNOT }
| '&'                   { BITAND }
| '|'                   { BITOR  }
| '^'                   { XOR    }
| "++"                  { CONCAT }


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


(* Accessor *)
| "^^"                    { OVERLAP }
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

(*identifiers *)
| ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']* as var_id  { ID(var_id) }

(* literals *)
| ['''] ((letter | digit | punc | otherChar ) as c)['''] { CHAR_LIT(c)}                     (* char literal   *)
| ['"'] (letter | digit | punc | otherChar )* ['"'] as s { STRING_LIT(s)}                   (* string literal *)
| ['0'-'9']+ as lit                                      { INT_LIT(int_of_string lit) }     (* int literal    *)
| ['0'-'9']* ['.'] ['0'-'9']+ as flit                    { FLOAT_LIT(float_of_string flit)} (* float literal  *)
| "true"                                                 { BOOL_LIT(true) }
| "false"                                                { BOOL_LIT(false) }

(* EOF *)
| eof                   { EOF }
| _ as ch               { raise (Failure("illegal character " ^ Char.escaped ch)) }

and lineComment =
  parse '\n'            { tokenize lexbuf }
  | _                   { lineComment lexbuf}

and comment =
  parse "*/"            { tokenize lexbuf }
  | _                   { comment lexbuf}


  (*| ['a'-'z' 'A'-'Z']['!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '[' ']' '{' '}' '\\' '/' '0'-'9' ',' '.' '+' '-' '*' ]* as over  { VAR(over) }*)