
     (* test grammar setup *)

let acc_phrase = ["the"; "quick"; "brown"; "fox"; "jumped"; "over";
"the"; "lazy"; "dog"]
let rej_phrase = ["jumped"; "over"; "the"; "lazy"; "dog";
"the"; "quick"; "brown"; "fox"]

type nonterms = 
| Phrase | Subj | Pred | NP | Noun | VP | Verb | Adj | Prep | AdvP

let grammar = (Phrase, function
| Phrase -> [[N Subj; N Pred]]
| Subj -> [[N NP]]
| Pred -> [[N VP]]
| NP -> [[N Noun]; [N Adj; N NP]]
| Noun -> [[T "fox"]; [T "dog"]]
| VP -> [[N Verb; N AdvP]]
| Verb -> [[T "jumped"]]
| Adj -> [[T "the"]; [T "quick"]; [T "brown"]; [T "lazy"]]
| Prep -> [[T "over"]]
| AdvP -> [[N Prep; N NP]])


     (* make_matcher tests *)

let acceptor s = Some s

let make_matcher_test0 = 
((make_matcher grammar acceptor acc_phrase) = Some [])

let make_matcher_test1 = 
((make_matcher grammar acceptor rej_phrase) = None)


     (* make_parser test *)
     (* inherently define an acceptor function for trees in hw2.ml *)

let make_parser_test0 = 
match (make_parser grammar acc_phrase) with
| None -> false
| Some tree -> if (parse_tree_leaves tree) = acc_phrase then true
else false
