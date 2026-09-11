(* You can use this playground for your own notes or experiments in OCaml.
   Beware that playgrounds don't tend to save super well, so do save things locally
   using the download button! *)

(* Enum *)
(* Modelling rock paper scissors *)

type hand = Rock | Paper | Scissors 
let my_hand  = Rock
let your_hand = Scissors
  
let beats (h1 : hand) (h2: hand) : bool = 
  (* true if h1 beats h2 *)
  
  match h1 with 
  | Rock -> h2 = Scissors 
(* h1 beats h2*)
  | Paper -> h2 = Rock
  | Scissors -> h2 = Paper
   
type outcome = Win | Draw | Lose
               
let play (h1 : hand) (h2 : hand) : outcome = 
  match (h1, h2) with
  | (h1, h2) when h1 = h2 -> Draw
  | (Rock, Paper) -> Lose
  | (Paper, Scissors) -> Lose
  | (Scissors, Rock) -> Lose
  | _ -> Win

(* Modelling Uno *)

type symbol = Skip | Plus2 | Number of int
type color = Blue | Red | Green

type card = symbol * color
let green3 = (Number 3, Green)
  
