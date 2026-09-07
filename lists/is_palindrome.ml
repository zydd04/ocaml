let l = ["x";"a"; "m"; "a"; "x"]

let rec rev list nl =
        match list with
        | [] -> nl
        | h :: t -> rev t (h :: nl)
;;

let new_l = rev l [];;

let c = new_l = l in
print_endline(Bool.to_string c);

