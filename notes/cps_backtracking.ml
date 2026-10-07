(* You can use this playground for your own notes or experiments in OCaml.
   Beware that playgrounds don't tend to save super well, so do save things locally
   using the download button! *)

exception No_Change
let rec change coins amount = match coins with
  | _ when amount = 0 -> []
  | [] -> raise No_Change
  | c :: cs -> 
      if c > amount then 
        change cs amount
      else
        try c:: change (c::cs) (amount - c) 
        with 
        |No_Change -> change cs amount
    
(*
  original code has 3 recursive calls 
  cps code too

*)                    
let rec change_cps coins amount 
    (return : int list -> 'r) (fail : unit -> 'r) : 'r = 
  
  match coins with
  |_ when amount = 0 -> return []
  |[] -> fail ()
  |c :: cs -> 
      if c > amount then 
        change_cps cs amount return fail
      else 
        change_cps (c::cs) (amount-c) (fun sol -> return (c :: sol)) 
          (fun () -> change_cps cs amount return fail)
     
          
type 'a tree = Empty | Node of 'a tree * 'a * 'a tree
let rec find (p : 'a -> bool) (t : 'a tree) : 'a option
  = match t with
  |Empty -> None
  |Node (l, x , r) -> 
      if p x then Some x
      else
        match find p l with
        |Some x -> Some x
        |None -> find p r
                   
                   
let rec find_cps (p: 'a -> bool) (t : 'a tree) (return : 'a option -> 'r) : 'r =
  match t with 
  | Empty -> return None
  | Node(l, x, r) ->
      if p x then return (Some x)
      else
        find_cps p l (fun res -> match res with
            |Some x -> return (Some x)
            |None -> find_cps p r return)
          
          
let rec find2 (p : 'a -> bool) (t : 'a tree) 
    (succeed : 'a -> 'r) (fail : unit -> 'r) : 'r =
  
  match t with
  | Empty -> fail ()
  | Node (l, x, r) -> 
      if p x then succeed x
      else
        find2 p l succeed (fun () -> find2 p r succeed fail)
  
let t = Node (Node(Empty, 4, Empty), 3, Node(Empty, 2, Empty))
  
  
  
  