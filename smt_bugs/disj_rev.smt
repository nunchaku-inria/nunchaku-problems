; This problem is very slow (22 s on JB's Mac). Removing any of the two disjuncts at the bottom of
; the file makes it very fast (< 1 s). A priori, an extra disjunct only makes the problem only
; easier. Also to note: The two disjuncts are fully independent -- they depend on different types
; and function symbols -- and they are clones of each other.

; cvc4 --finite-model-find --lang smt disj_rev.smt

(set-option :produce-models true)
(set-option :interactive-mode true)
(set-logic ALL_SUPPORTED)
(declare-sort a_ 0)
(declare-fun __nun_card_witness_0 () a_)
(declare-datatypes () ((list_
                          (Cons_ (_select_Cons__0 a_) 
                             (_select_Cons__1 list_)) 
                          (Nil_ ))))
(declare-sort G_append_ 0)
(declare-fun __nun_card_witness_1 () G_append_)
(declare-fun append_ (list_ list_) list_)
(declare-fun proj_G_append__0 (G_append_) list_)
(declare-fun proj_G_append__1 (G_append_) list_)
(assert
 (forall ((a/75 G_append_))
    (and
     (= (append_ (proj_G_append__0 a/75) (proj_G_append__1 a/75))
      (ite (is-Cons_ (proj_G_append__0 a/75))
        (Cons_ (_select_Cons__0 (proj_G_append__0 a/75)) 
         (append_ (_select_Cons__1 (proj_G_append__0 a/75)) 
          (proj_G_append__1 a/75)))
        (proj_G_append__1 a/75))) 
     (ite (is-Cons_ (proj_G_append__0 a/75))
       (exists ((a/76 G_append_))
          (and (= (proj_G_append__1 a/75) (proj_G_append__1 a/76)) 
           (= (_select_Cons__1 (proj_G_append__0 a/75))
            (proj_G_append__0 a/76))))
       true))))
(declare-sort G_rev_ 0)
(declare-fun __nun_card_witness_2 () G_rev_)
(declare-fun rev_ (list_) list_)
(declare-fun proj_G_rev__0 (G_rev_) list_)
(assert
 (forall ((a/77 G_rev_))
    (and
     (= (rev_ (proj_G_rev__0 a/77))
      (ite (is-Cons_ (proj_G_rev__0 a/77))
        (append_ (rev_ (_select_Cons__1 (proj_G_rev__0 a/77))) 
         (Cons_ (_select_Cons__0 (proj_G_rev__0 a/77)) Nil_))
        Nil_)) 
     (ite (is-Cons_ (proj_G_rev__0 a/77))
       (and
        (exists ((a/78 G_append_))
           (and
            (= (Cons_ (_select_Cons__0 (proj_G_rev__0 a/77)) Nil_)
             (proj_G_append__1 a/78)) 
            (= (rev_ (_select_Cons__1 (proj_G_rev__0 a/77)))
             (proj_G_append__0 a/78)))) 
        (exists ((a/79 G_rev_))
           (= (_select_Cons__1 (proj_G_rev__0 a/77)) (proj_G_rev__0 a/79))))
       true))))
(declare-fun xs_ () list_)
(declare-sort b_ 0)
(declare-fun __nun_card_witness_3 () b_)
(declare-datatypes () ((list2_
                          (Cons2_ (_select_Cons2__0 b_) 
                             (_select_Cons2__1 list2_)) 
                          (Nil2_ ))))
(declare-sort G_append2_ 0)
(declare-fun __nun_card_witness_4 () G_append2_)
(declare-fun append2_ (list2_ list2_) list2_)
(declare-fun proj_G_append2__0 (G_append2_) list2_)
(declare-fun proj_G_append2__1 (G_append2_) list2_)
(assert
 (forall ((a/80 G_append2_))
    (and
     (= (append2_ (proj_G_append2__0 a/80) (proj_G_append2__1 a/80))
      (ite (is-Cons2_ (proj_G_append2__0 a/80))
        (Cons2_ (_select_Cons2__0 (proj_G_append2__0 a/80)) 
         (append2_ (_select_Cons2__1 (proj_G_append2__0 a/80)) 
          (proj_G_append2__1 a/80)))
        (proj_G_append2__1 a/80))) 
     (ite (is-Cons2_ (proj_G_append2__0 a/80))
       (exists ((a/81 G_append2_))
          (and (= (proj_G_append2__1 a/80) (proj_G_append2__1 a/81)) 
           (= (_select_Cons2__1 (proj_G_append2__0 a/80))
            (proj_G_append2__0 a/81))))
       true))))
(declare-sort G_rev2_ 0)
(declare-fun __nun_card_witness_5 () G_rev2_)
(declare-fun rev2_ (list2_) list2_)
(declare-fun proj_G_rev2__0 (G_rev2_) list2_)
(assert
 (forall ((a/82 G_rev2_))
    (and
     (= (rev2_ (proj_G_rev2__0 a/82))
      (ite (is-Cons2_ (proj_G_rev2__0 a/82))
        (append2_ (rev2_ (_select_Cons2__1 (proj_G_rev2__0 a/82))) 
         (Cons2_ (_select_Cons2__0 (proj_G_rev2__0 a/82)) Nil2_))
        Nil2_)) 
     (ite (is-Cons2_ (proj_G_rev2__0 a/82))
       (and
        (exists ((a/83 G_append2_))
           (and
            (= (Cons2_ (_select_Cons2__0 (proj_G_rev2__0 a/82)) Nil2_)
             (proj_G_append2__1 a/83)) 
            (= (rev2_ (_select_Cons2__1 (proj_G_rev2__0 a/82)))
             (proj_G_append2__0 a/83)))) 
        (exists ((a/84 G_rev2_))
           (= (_select_Cons2__1 (proj_G_rev2__0 a/82))
            (proj_G_rev2__0 a/84))))
       true))))
(declare-fun ys_ () list2_)
(assert
  (or
; disjunct #1
   (and (not (= (rev_ xs_) xs_)) (exists ((a/85 G_rev_)) (= xs_ (proj_G_rev__0 a/85))))
; disjunct #2
   (and (not (= (rev2_ ys_) ys_)) (exists ((a/86 G_rev2_)) (= ys_ (proj_G_rev2__0 a/86))))
    ))
(check-sat)