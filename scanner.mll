{ open Parser }

rule tokenize = parse
  [' ' '\t' '\r' '\n'] { tokenize lexbuf }
| '+' { PLUS }
| '-' { MINUS }
| '*' { TIMES }
| '/' { DIVIDE }
| '=' { ASSIGN }
| ';' { SEMICOLON }
| "if"                 { IF } 
| "then"               { THEN }
| "else"               { ELSE }
| ['0'-'9']+ as lit    { LITERAL(int_of_string lit) }
| ['a'-'z']+ as var_id { VAR(var_id) }
| eof                  { EOF }
