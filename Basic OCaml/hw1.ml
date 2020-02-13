(*Question 1*)
let rec subset a b = 
match a, b with
[],[]
| [],_ -> true
| _,[] -> false
| c::cc,_ -> if List.mem c b then subset cc b else false

(*Question 2*)
let equal_sets a b = 
(subset a b) && (subset b a)

(*Question 3*)
let set_union a b = 
match a,b with
[],_ -> b
| _,[] -> a
|c::cc,d::dd -> List.append a b

(*Question 4*)
let rec set_intersection a b = 
match a, b with
[],[]
| [],_
| _,[] -> []
| c::cc,_ -> if (List.mem c b) then c::set_intersection cc b else set_intersection cc b

(*Question 5*)
let rec set_diff a b = 
match a, b with
[],[]
| [],_ -> []
| _,[] -> a
| c::cc,_ -> if (List.mem c b) then set_diff cc b else c::set_diff cc b

(*Question 6*)
let rec computed_fixed_point eq f x = 
if eq (f x) x then x else computed_fixed_point eq f (f x)

(*Question 7*)
type ('nonterminal, 'terminal) symbol =
  | N of 'nonterminal
  | T of 'terminal

let rec parse_rhs r =
match r with
[] -> []
| (T n)::cc -> parse_rhs cc
| (N n)::cc -> n::parse_rhs cc

let rec parse_rules rules elem = 
match rules with
[] -> []
| (a,rhs)::cc -> if (List.exists (fun x -> x=a) elem) 
then set_union (parse_rhs rhs) (set_union elem (parse_rules cc elem))
else set_union elem (parse_rules cc elem)

let get_reachable start rules =
set_union (computed_fixed_point (equal_sets)(fun x -> parse_rules rules x)[start]) []

let rec filter rules reach =
match rules with
[] -> []
| (a,r)::cc -> if (List.exists (fun x -> x=a) reach)
then (a,r)::(filter cc reach) else filter cc reach

let filter_reachable g = 
match g with
(a,b) -> (a, filter b (get_reachable a b));;
