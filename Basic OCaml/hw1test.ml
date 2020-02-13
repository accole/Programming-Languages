let my_subset_test0 = subset [] [3;4;1]
let my_subset_test1 = subset [3;1;5;7] [3;1;5;7;]
let my_subset_test2 = subset [] []
let my_subset_test3 = not (subset [3;4;1] [])
let my_subset_test4 = subset [7;4;7] [4;7;8]

let my_equal_sets_test0 = equal_sets [5;8] [8;5]
let my_equal_sets_test1 = equal_sets [3;1;3] [1;3]
let my_equal_sets_test2 = not (equal_sets [1] [])
let my_equal_sets_test3 = equal_sets [] []

let my_set_union_test0 = equal_sets (set_union [1;3;5] []) [1;3;5]
let my_set_union_test1 = equal_sets (set_union [1;1;2;2] [2;4]) [1;2;4]
let my_set_union_test2 = equal_sets (set_union [] [3]) [3]
let my_set_union_test3 = equal_sets (set_union [] []) []

let my_set_intersection_test0 = equal_sets (set_intersection [1;1;7] [1;7;5]) [1;7]
let my_set_intersection_test1 = equal_sets (set_intersection [1;1;7] [1;1;7;5]) [1;7]
let my_set_intersection_test2 = equal_sets (set_intersection [] [1;7;5]) []
let my_set_intersection_test3 = equal_sets (set_intersection [1;2;3;4] [1;5]) [1]

let my_set_diff_test0 = equal_sets (set_diff [2] [1;2;3]) []
let my_set_diff_test1 = equal_sets (set_diff [1;4] [4;1]) []
let my_set_diff_test2 = equal_sets (set_diff [] []) []
let my_set_diff_test3 = equal_sets (set_diff [1;4;5] [4;1]) [5]
let my_set_diff_test4 = equal_sets (set_intersection (set_diff [2;3;1] [2;4])[3])[3]
let my_set_diff_test5 = equal_sets (set_diff [1;3] [1;3;4]) []

let my_computed_fixed_point_test0 = computed_fixed_point (=) (fun x -> x/x) 1 = 1
let my_computed_fixed_point_test1 = computed_fixed_point (=) (fun x -> if x<0 then x+1 else 0) (-3) = 0
let my_computed_fixed_point_test2 = computed_fixed_point (=) (fun x -> x**3.) 2. = infinity
let my_computed_fixed_point_test3 = computed_fixed_point (=) sin (2.0 *. asin(1.)) < 0.00000000001

type nonterminals =
| W | X | Y | Z

let rules =
[(W, [N X; N Y; N Z]);
(X, [N Y; N Z]);
(Y, [N Z]);
(Z, [T "cs131"])]

let my_filter_reachable_test0 = filter_reachable (X, rules) = 
(X, [(X, [N Y; N Z]); (Y, [N Z]); (Z, [T "cs131"])])
let my_filter_reachable_test1 = filter_reachable (Y, rules) =
(Y, [(Y, [N Z]); (Z,[T "cs131"])])
let my_filter_reachable_test2 = filter_reachable (Z, rules) = 
(Z, [(Z,[T "cs131"])])
