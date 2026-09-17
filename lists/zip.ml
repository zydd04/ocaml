let l2 = 1 :: 2 :: 3 :: []
let l3 = [1; 2; 3]

let rec zip (xs : 'a list) (ys: 'b list) : ('a * 'b) list =
  match xs, ys with
  | [], [] -> []
  | _ , [] -> []
  | [], _ -> []
  | x::xs, y::ys -> (x, y):: zip (xs) (ys)