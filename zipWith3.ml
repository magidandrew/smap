(* Problem 1:

Write an OCaml function "zipWith3" that takes a function and three lists
and returns a list of the result of the function run on the first element
from each list, then the second element of each list, etc.  The result should
be the same length as the shortest given list.

E.g.,

zipWith3 (fun x z y -> x + y + z) [] [] [] = []

zipWith3 (fun x z y -> x + y + z) [1;2;3] [4;5;6] [7;8;9] = [12; 15; 18]

zip3 [1;2] ['a';'b';'c'] [0;0] = [(1, 'a', 0); (2, 'b', 0)]

*)

let rec zipWith3
    (f : 'a -> 'b -> 'c -> 'd)
    (l1 : 'a list)
    (l2 : 'b list)
    (l3 : 'c list) : 'd list
    = if ((l1 == []) || (l2 == []) || (l3 == [])) then []
      else ((f (List.hd l1) (List.hd l2) (List.hd l3))::(zipWith3 f (List.tl l1) (List.tl l2) (List.tl l3)))



