
     (* Question 1 convert_grammar *)

let rec newgram rules new_acc curr = 
match rules with
| [] -> new_acc
| next_rule::cc -> match next_rule with
    | (expr, rhs) -> if expr == curr then newgram cc (rhs::new_acc) curr
                     else newgram cc new_acc curr

let convert_grammar gram1 = match gram1 with
(start, rules) -> (start, newgram rules [])




     (* Question 2 parse_tree_leaves *)

type ('nonterminal, 'terminal) tree = 
  | Leaf of 'terminal
  | Node of 'nonterminal * ('nonterminal, 'terminal) tree list

let rec record_leaves = function
| [] -> []
| h::t -> let check_node = function
    | Leaf t -> [t]
    | Node (nt, children) -> record_leaves children
in (check_node h) @ (record_leaves t)

let parse_tree_leaves ptree = record_leaves [ptree]




     (* Question 3 make_matcher *)

let q3 a b = a

type ('nonterminal, 'terminal) symbol =
  | N of 'nonterminal
  | T of 'terminal

     (* runs through one nonterminal's set of rules - starts with start symbol *)
     (* if set of rules is empty, nothing further to parse *)
let rec parse_gram qfun gram rules acc frag = match rules with
| [] -> None
| rule::rest -> let

     (* breaks down prefixes / suffixes in fragment and matches them
        to current Nonterm subrule types *)
     (* if the subrule is empty, return acceptor return val *)
     (* else check that subrule and frag match types by divide and conquer *)
     (* if the first subrule symbol is Terminal and matches the first element
        in the fragment, check the rest of the subrule (cc) with the rest
        of the fragment (suffix) *)
     (* if the first subrule symbol is Nonterminal, restart process with
        the nonterminal rule set. the acceptor for this call ensures an
        acceptor match with the remainder of the fragment *)
rec parse_rule qf grammar expr accept frag = 
if expr = [] then (accept frag) else match frag with
| [] -> None
| prefix::suffix -> match expr with
    | (T term)::cc -> if prefix = term then (parse_rule qf grammar cc accept suffix)
                      else None
    | (N nonterm)::cc -> let next_ruleset = (grammar nonterm)
    and acceptor = (parse_rule qf grammar cc accept)
    in (parse_gram qf grammar next_ruleset acceptor frag)
    | [] -> None

     (* try to match fragment with first subrule *)
     (* if accpetor returned something, return this val *)
     (* if nothing returned, move onto next subrule *)
in let ret = (parse_rule qfun gram rule acc frag)
in match ret with
| None -> (parse_gram qfun gram rest acc frag)
| Some value -> Some (qfun value rule)


     (* returns a matcher for a grammar with acceptor on fragment frag *)
     (* (grammar start) returns the grammar section of nonterminal 'start' *)
let make_matcher = function
| (start, grammar) -> let start_rules = (grammar start) in
fun acceptor fragment -> (parse_gram q3 grammar start_rules acceptor fragment)




     (* Question 4 make_parser *)

let tree_acceptor frag = match frag with
| [] -> Some []
| _ -> None

     (* used to append rules to a path list *)
let q4 a b = b::a


     (* traverses returned path and creates/returns parse tree in tuple form *)
     (* creates the parse_tree from leaves to root *)
let rec parse_path head path = match head with
| [] -> (path, [])
| a::b -> let

     (* parses down the current node to find the subtree below *)
     (* if the root of the subtree is Terminal, we only append the Leaf node with 
        the remaining path and the overall tree structure begins to build from here *)
     (* if the root of the subtree is Nonterminal, we must append a Node to the tree *)
     (* if pieces of the path still remain, we recursively call parse_path to continue
        constructing the remaining subtree. If this is the last piece of the path, 
        we append a node to the nonterminal *)
rec find_children root rem_path = match root with
| (N nonterm) -> (match rem_path with
    | [] -> ([], Node (nonterm, []))
    | rem::pth -> let nont_subtr = (parse_path rem pth) in match nont_subtr with
        | (child_rem_path, siblings) -> (child_rem_path, Node (nonterm, siblings)))
| (T term) -> (match rem_path with
    | [] -> ([], Leaf term)
    | rem::pth -> (rem::pth, Leaf term))

     (* find subtree below current node (a) by calling find_children *)
     (* after matching current node (a), recursively call parse_path on the 
        rest of the path of rules traversed with the next symbol (sym) *)
     (* when this returns, create the node and combine with sibling trees of curr node (a) *)
in let subtr = (find_children a path) in match subtr with
| (sym, rule) -> let next = (parse_path b sym) in match next with
    | (p_rest, siblings) -> (p_rest, rule::siblings)



     (* returns a parser for a grammar on fragment frag *)
     (* eliminates duplicate code by repeating make_matcher code using q4 *)
     (* function q4 stores the traversal path instead of q3 which just returns the value *)
     (* fun returns a path taken by the parser *)
     (* then create parse tree of the frag traversal and return the root *)
let make_parser gram = match gram with
| (start, grammar) -> fun fragment -> let start_rules = (grammar start) in
match (parse_gram q4 grammar start_rules tree_acceptor fragment) with
None -> None
| Some [] -> None
| Some path -> let head = [N start] in let tup = (parse_path head path) in
    match tup with
    | (sym, ptree) -> match ptree with
        [] -> None
        | root::rest -> Some root
