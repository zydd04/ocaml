(* You can use this playground for your own notes or experiments in OCaml.
   Beware that playgrounds don't tend to save super well, so do save things locally
   using the download button! *)

(* Polymorphic values/ functions *)

let f x = x
  
(*type variable 'a : val f : 'a -> 'a = <fun> *)

let ex1 = f "hello"
let ex2 = f 5
    
let g y x = y (* 'a -> 'b -> 'a *)
              
let h x y =
  let  _ = x + 1 in 
  y
    
let rec oops x  = oops x
    
(* 'a -> 'b : arbitrary input, output*)
    
let j p = (fst p + 1, snd p)
    
(* int * 'a -> int * 'a *)

type color = Green | Blue | Red | Yellow
              
type symbol = 
  | Skip 
  | Number of int
  | Reverse
  | Plus2

type card = 
  color * symbol

type number_card_result = 
  | HereIsTheCard of card
  | InvalidNumber
    
let make_number_card color n : number_card_result = 
  if 0 < n && n <= 9 then
    HereIsTheCard (color, Number n)
(* must have else case*)
  else 
    InvalidNumber
;;

type 'a option = 
  | None
  | Some of 'a


let make_number_card color n : card option = 
  if 0 < n && n <= 9 then
    Some (color, Number n)
(* must have else case*)
  else 
    None
      
type 'a pile = 
  | Empty 
  | Extend of 'a * 'a pile
              
let l1 = Extend(1, Extend(2, Empty))

(*
type 'a list = 
| []
|(::) of 'a * '
a list
   *)
   
let l2 = 1 :: 2 :: 3 :: []
let l3 = [1; 2; 3]

let rec len (l : 'a list) : int = 
  match l with 
  | [] -> 0
  | _ :: xs -> 1 + len xs 

let rec take (n : int) (l :  'a list) : 'a list = 
  match n, l with 
  | _, [] -> []
  | 0, _ -> []
  | n, x::xs -> x :: take (n-1) xs

let rec zip (xs : 'a list) (ys: 'b list) : ('a * 'b) list = failwith ""
let rec take_last (n : int ) (l: 'a list) : 'a list = failwith ""




         
         