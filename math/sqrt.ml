let n = float_of_string Sys.argv.(1);;

let rec sqrt n x =
       
        let n1 = (x +. (n /. x)) /. 2. in
        if abs_float(n1 -. x) < 0.1 then n1 else
               sqrt n n1
        
;;

let q = sqrt n 1. in 
print_float q;;
