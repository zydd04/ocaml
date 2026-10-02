(* You can use this playground for your own notes or experiments in OCaml.
   Beware that playgrounds don't tend to save super well, so do save things locally
   using the download button! *)

(* /\/\/\/\/\/\/\/\/\ Backtracking /\/\/\/\/\/\/\/\/\/\ *)
type 'a tree =
  |Empty
  |Node of 'a tree * 'a * 'a tree
  
let rec random_tree h = 
  if h = 0 then Empty else
    (*let lh = Random.int h in 
     let rh = Random.int h in*)
    let lh = h-1 in
    let rh = h-1 in
    Node (random_tree lh, Random.int 100, random_tree rh)
(* let find (P : 'a -> bool)  (t : 'a tree) : 'a option = match t with *)             

let rec find (p : 'a -> bool) = function 
  |Empty -> None
  |Node (l, x, r) -> if p x then Some x else
        match find p l with 
        | Some v -> Some v 
        | None -> find p r
                    
let t = random_tree 3
    
    (* exceptions *)

exception LogInException 
let the_password = "secret_password"
let check_password user_password = 
  if user_password <> the_password then raise LogInException 
  
let login password : bool =
  try 
    let _ = check_password password in true
  with
  | LogInException -> false
    
exception NotInTree

let rec find (p : 'a -> bool) = function 
  |Empty -> raise NotInTree 
  |Node (l, x, r) -> if p x then x else
        try 
          find p l
        with 
        |NotInTree -> find p r
                    
let find1 p t =
  try Some (find p t) with
  |NotInTree -> None
  
exception NotPossible
  
let rec change_greedy (coins : int list) (amount : int) : int list =
  match coins with
  | _ when amount = 0 -> []
  |[] -> raise NotPossible
  | c :: cs -> if c > amount
      then change_greedy cs amount
      else c :: change_greedy (c :: cs) (amount  - c)
  
;;
exception NoChange
let rec change (coins : int list) (amount : int) : int list = 
  match coins with
  | _ when amount = 0 -> []
  | [] -> raise NoChange
  |c :: cs -> 
      if c > amount then change cs amount else
        try 
          c :: change (c::cs) (amount - c)
        with
        |NoChange -> change cs amount
  
  
  