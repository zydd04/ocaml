let l = [1; 2; 3; 4; 5];;

let rec rev list nl = 
       match list with
       | [] -> nl 
       | h :: t -> rev t (h :: nl)
;;

let rec print list =
       match list with
       | [] -> ()
       | h :: t -> 
                       print_int h;
                       print_string " ";
                       print t;

;;

let l = rev l [];;
print l;;

 
