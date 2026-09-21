let x = float_of_string Sys.argv.(1)
type exp = 
|C of float
|X
|P of exp * exp
|T of exp * exp
|D of exp * exp

let rec eval (e : exp) (x : float) : float = 
        match e with 
        |X -> x
        |C(c) -> c
        |P(a, b)-> eval a x +. eval b x
        |T(a,b)-> eval a x *. eval b x
        |D(a,b)-> eval a x /. eval b x
;;
let e = P(P(T(X, X), T(C(2.),X)), C(1.))
let r = eval e x
let () =
        print_float(r);;
