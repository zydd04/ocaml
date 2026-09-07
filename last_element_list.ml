let l = [1; 2; 3];;

let rec loop list =
       match list with
       | [] -> None
       | [x] -> Some x
       | _ :: tail -> loop tail
                      
 
let () = 
       match (loop l) with
        | Some x -> print_int x
        | None -> print_endline "Not Found" 


