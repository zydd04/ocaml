type symbol = Skip |Plus2 | Number of int
type color = Green | Red | Blue
type card = symbol * color 
  
let green3 = (Number 3, Green)
type pile = 
  | Empty
  | Extend of card * pile (* recursive *)
                          
let my_hand = (* example hand with three cards in it. *)
  Extend (green3, Extend (green3, Extend ((Skip,Blue), Empty )))

(* Recursive functions are well-suited to deal with recursive types.
   Let's write a function to calculate the length of a pile of cards. *)

let rec len (p : pile) : int =
  match p with
  | Empty -> 0
  | Extend (_, p) -> (* Shadowing the outer `p` *)
      1 + len p

let rec sum_numbers (p : pile) : int = 
  match p with
  | Empty -> 0
  | Extend ((Number n, _), rest) -> n + sum_numbers rest
  | Extend (_, rest) -> sum_numbers rest