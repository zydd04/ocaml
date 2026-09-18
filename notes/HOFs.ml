(* You can use this playground for your own notes or experiments in OCaml.
   Beware that playgrounds don't tend to save super well, so do save things locally
   using the download button! *)

(* higher-order functions *)

let rec append1 (y : 'a) (l : 'a list) = 
  match l with
  | [] -> [y]
  | x :: xs -> x :: append1 y xs

(*Append ys to the end of xs*)

let rec append (xs : 'a list) (ys : 'a list) = 
  match xs with 
  | [] -> ys
  | x :: xs -> x :: append xs ys
                 
let rec rev_tr (xs : 'a list) (nl : 'a list) : 'a list =
  match xs with
  | [] -> nl 
  | x :: xs -> rev_tr xs (x :: nl)

let rec rev (xs : 'a list) : 'a list =
  match xs with
  | [] -> [] 
  | x :: xs -> append1 x (rev xs) 
;;

(* *************** Higher-order Functions **************************)

let compose f g = fun x -> f (g x) 

(* val compose : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun> *)

let compose = fun f g x -> f (g x)
(* Lambda function *)
let h = compose (fun x -> x + 1) (fun x -> x  * 2)
    
let twice f x = f (f x)
let double x = x * 2
let quadruple x = twice double x
(* same as*)
let quadruple = twice double

let rec times n f x = 
  if n = 0 then x else
    times (n-1) f (f x)
      
let pow (n : int) (k : int) : int = failwith "exe"
    
let rec map (f : 'a -> 'b) (xs : 'a list) : 'b list = 
  match xs with 
  | [] -> []
  | x :: xs -> f x :: map f xs
                 
let rec filter (p : 'a -> bool) (xs : 'a list) : 'a list =
  match xs with
  | [] -> []
  | x :: xs -> 
      if p x
      then x :: filter p xs
      else filter p xs


let rec fold_right (f : 'a -> 'b -> 'b) (xs : 'a list) (z : 'b) : 'b =
  match xs with
  |[] -> z
  |x ::  xs -> f x (fold_right f xs z)