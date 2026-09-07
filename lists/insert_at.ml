let l = [1; 2; 4; 5];;
let i = int_of_string Sys.argv.(1);;

(* insert x at i *)

let rec insert list x i = 
        match list with
        | [] -> [x]
        | h :: t  -> 
                        if i = 0 then x :: list 
                        else h :: insert t x (i - 1) 
;;


let rec print list =
        match list with
        | [] -> ()
        | h :: t ->
                        print_int(h);
                        print_string(" ");

                        print t;

;;

let q = insert l 3 i;;
print q;
