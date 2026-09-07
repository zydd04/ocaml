let n1 = int_of_string Sys.argv.(1);;
let n2 = int_of_string Sys.argv.(2);;

let rec gcd a b =
        let r = a - b*(a/b) in 
        if r = 0 then b else
               gcd b r 
;;

let res = gcd n1 n2 in 
print_int(res);;

