let l = [1; 2; 3; 4]

let rec len list n = 
        match list with
        | [] -> n
        | _ :: tail -> len tail (n+1)
;;

let () = 
        let ans = len l 0 in 
        print_int(ans);; 
