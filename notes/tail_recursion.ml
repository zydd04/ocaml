(* You can use this playground for your own notes or experiments in OCaml.
   Beware that playgrounds don't tend to save super well, so do save things locally
   using the download button! *)

let rec sum n = 
  if n = 0 then 0 else n + sum (n-1) (* call stack *)
;;

let n = sum 5 ;;
  
let rec sum' partial_sum n = 
  if n = 0 then partial_sum else 
    sum' (partial_sum + n) (n - 1) (* tail reccursive *)
      
let x = sum' 0 5;;

let rec factorial (p : int)  (n : int) : int =
  if n = 0 then p else factorial (n * p) (n-1)
;;

let factorial n = factorial 1 n
let x = factorial 1 

let rec fib a b n = 
  if n = 0 then a else 
    fib b (a + b) (n -1)
  
let fib n = fib 1 2 n
    
    

    (* ******************* TYPES ***************** *)

type name = string
let my_name : name = "zyd"
  
type height_cm = int
  
type person = name * height_cm
              
let me : person = ("" , 1)
                  
let is_tall p =  snd p > 190
                             
                                   
              
              