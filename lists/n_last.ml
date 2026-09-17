let rec take (n : int) (l :  'a list) : 'a list = 
  match n, l with 
  | _, [] -> []
  | 0, _ -> []
  | n, x::xs -> x :: take (n-1) xs
                  
let rec help l l2 =
  match l with
  | [] -> l2
  | h::t -> help t (h::l2)
              
let rec take_last (n : int ) (l: 'a list) : 'a list = 
  let l = help l [] in
  take n l
            