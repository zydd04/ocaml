let n = int_of_string Sys.argv.(1);;

let rec prime n m =
        if n < 2 then false else
        if n = m * m then false else
        if n mod m = 0 then false else
        if m = n - 1 then true else   
                prime n (m + 1) 
;;

let y = prime n 2 in
        print_endline(Bool.to_string(y));;
