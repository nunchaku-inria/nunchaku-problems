# outcome: timeout
# expected: sat

# Nitpick can do it in one second.

(set-option :produce-models true)
(set-option :interactive-mode true)
(set-logic ALL_SUPPORTED)
(declare-datatypes () ((nat (Zero) (Suc (pred nat)))))
(declare-sort a 0)
(declare-datatypes ()
   ((tree (Leaf (leafW nat) (label a)) 
       (InnerNode (innerW nat) (left tree) 
          (right tree)))))
(define-fun-rec alphabet ((v_0 tree) (v_1 a)) Bool
       (ite (is-Leaf v_0)
         (= (label v_0) (label v_0))
         (or (alphabet (left v_0) v_1) 
          (alphabet (right v_0) v_1))))
(define-fun-rec consistent ((v_0 tree)) Bool
      (or (is-Leaf v_0)
       (and (consistent (left v_0)) 
        (consistent (right v_0)) 
        (forall ((a1 a))
           (or (not (alphabet (left v_0) a1)) 
            (not (alphabet (right v_0) a1)))))))
(declare-fun nun_sk_0 () tree)
(declare-datatypes ()
   ((list (Nil ) (Cons (hd tree) (tl list)))))
(define-fun-rec lesseq ((v_0 nat) (v_1 nat)) Bool
         (or (is-Zero v_0)
          (and (not (is-Zero v_1)) 
           (lesseq v_0 (pred v_1)))))
(define-fun-rec cachedWeight ((v_0 tree)) nat
     (ite (is-Leaf v_0) (leafW v_0)
       (innerW v_0)))
(define-fun-rec insortTree ((v_0 tree) (v_1 list)) list
        (ite (is-Nil v_1) (Cons v_0 Nil)
          (ite
            (lesseq (cachedWeight (hd v_1)) 
             (cachedWeight (hd v_1)))
            (Cons (hd v_1) 
             (Cons (hd v_1) (tl v_1)))
            (Cons (hd v_1) 
             (insortTree (hd v_1) (tl v_1))))))
(define-fun-rec plus ((v_0 nat) (v_1 nat)) nat
        (ite (is-Zero v_0) v_1
          (Suc (plus (pred v_0) v_1))))
(define-fun-rec uniteTrees ((v_0 tree) (v_1 tree)) tree
        (InnerNode (plus (cachedWeight v_0) (cachedWeight v_1)) 
         v_0 v_1))
(define-fun-rec huffman ((v_0 list)) tree
     (ite (is-Nil v_0) (huffman v_0)
       (ite (is-Nil (tl v_0)) (hd v_0)
         (huffman
          (insortTree
           (uniteTrees (hd (tl v_0)) 
            (hd (tl v_0))) 
           (tl (tl v_0)))))))
(declare-fun ts () list)
(define-fun-rec freq ((v_0 tree) (v_1 a)) nat
        (ite (is-Leaf v_0)
          (ite (= (label v_0) v_1)
            (leafW v_0) Zero)
          (plus (freq (left v_0) v_1) 
           (freq (right v_0) v_1))))
(define-fun-rec weight ((v_0 tree)) nat
     (ite (is-Leaf v_0) (leafW v_0)
       (plus (weight (left v_0)) 
        (weight (right v_0)))))
(define-fun-rec cost ((v_0 tree)) nat
     (ite (is-Leaf v_0) Zero
       (plus
        (plus
         (plus (weight (left v_0)) 
          (cost (left v_0))) 
         (weight (right v_0))) 
        (cost (right v_0)))))
(assert
 (and (consistent nun_sk_0) 
  (forall ((x a))
     (and
      (or (not (alphabet (huffman ts) x)) (alphabet nun_sk_0 x)) 
      (or (not (alphabet nun_sk_0 x)) (alphabet (huffman ts) x)))) 
  (forall ((x a)) (= (freq (huffman ts) x) (freq nun_sk_0 x))) 
  (not (lesseq (cost (huffman ts)) (cost nun_sk_0)))))
(check-sat)
