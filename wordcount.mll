(* Modify this file to produce a word frequency counter.

 Outside source consulted: 
 https://stackoverflow.com/questions/52546827/map-fold-in-ocaml
 https://ocaml.org/releases/4.05/htmlman/libref/Misc.StringMap.html
*)

{
  type token = EOF | Word of string
}

rule token = parse
  | eof { EOF }
  | ['a'-'z' 'A'-'Z']+ as word { Word(word) }
  | _ { token lexbuf }

{

module StringMap = Map.Make(String);;

 let lexbuf = Lexing.from_channel stdin in
 let wordlist = 
   let rec next l =
     match token lexbuf with
	 EOF -> l
     | Word(s) -> next (s :: l)
   in next []
 in

 (* Replace the code below this comment with code that scans through
    the list and builds a string map whose keys are words and whose
    values count the number of apearances of each word.  Then, use
    StringMap.fold to convert this to a list of (count, word) tuples. *)
 let addToMap 
     (map : (int StringMap.t))
     (key : string): (int StringMap.t)
     = match (StringMap.find_opt key map)
     with None -> StringMap.add key 1 map
     | Some(count) -> StringMap.add key (count+1) map
 in
 let wordMap = List.fold_left addToMap StringMap.empty wordlist
 in
 let wordcounts = StringMap.fold (fun k v acc -> (v,k)::acc) wordMap []
 in
 let printTuple
     (tup: int*StringMap.key) : unit
     = print_endline (string_of_int (fst tup)^" "^(snd tup))
 in

 (* Use the following code to sort the list of (count, word) pairs

 let wordcounts =
   List.sort (fun (c1, _) (c2, _) -> Pervasives.compare c2 c1) wordcounts in
  *)
let wordcounts =
   List.sort (fun (c1, _) (c2, _) -> Stdlib.compare c2 c1) wordcounts in
   List.iter printTuple wordcounts

 (* Print the count, word pairs using List.iter

The output from running wordcount on the README file should look something like
# ./wordcount < README
12 the
11 to
11 and
8 should
4 for
4 foo
4 be
4 baz
4 bar
4 assignment
4 a
3 zip
...

 *)

}
