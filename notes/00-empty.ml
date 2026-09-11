(* You can use this playground for your own notes or experiments in OCaml.
   Beware that playgrounds don't tend to save super well, so do save things locally
   using the download button! *)
let n = 1
let n1 = 2 ;;
let n2 = n + n1 ;;
let n3 = 3. ;;
let n4 = 2.1 ;;
let n5 = n3 +. n4 ;;
let s1 = "Comp " ^ "302";;
(*comment
  def
  fefc
*)

let c = 'c' ;;
let c2 = '2'
let c3 = '\n'
             

(*boolean*)
let b1 = true
let b2 = false
  
let q1 = if false then 1. else 2. /. 0.
let q2 = if true then 1. else 2. (* both arms should be float *)
let q4 = 0 = 0
let q5 = if 1 <> 0 then 2 else 0 
                                 
(* functions 
   
   let creates new defs
     
   call :  function name -> f  a <- argument
    
   surround args with () Ex: f (n-1) != f n - 1
   
  rec keyword for recursive definitions
*)

let rec fib n = 
  if n = 0 then 0 else
  if n = 1 then 1 else
    fib (n-1) + fib (n-2) ;;

let greet name = "Hello, " ^ name ;; 
(* let foo = name : Synatx Error name Unbound (not in global scope) *) 

let greet lang name = (* greet lang name is shadowing the older greet def *)
  (if lang = "fr" then "Bonjour, " else "Hello, ") ^ name
  
let greeet lang name = 
  (* in keyword *) 
  let greeting  = (if lang = "fr" then "Bonjour, " else "Hello, ")
                                                                  
(* let - in needed for let to be an expression local binding *)
  in 
  greeting ^ name
  
  
let x = 5
let f y = x + y
let x = 8
let a = f 10 (* = 15, because x = 5 is taken by f first even if x = 8 now *)
  
let rec fib n a b = 
  if n = 0 then a else
    fib (n-1) b (a+b)