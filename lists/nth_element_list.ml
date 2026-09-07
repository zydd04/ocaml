let n = int_of_string Sys.argv.(1);;
let l = [1; 2; 3; 4; 5]

let rec find list n =
        match list with
        | [] -> None
        | head :: tail ->
                        if n = 0 then Some head
                        else find tail (n-1)
;;
let () =      
        match find l n with
        | None -> print_string "Not Found"
        | Some x -> print_int x
;;
