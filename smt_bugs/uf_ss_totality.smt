; cvc4 --finite-model-find --lang smt --uf-ss-totality uf_ss_totality.smt
; outcome: unsat
; expected: sat or unknown

; The result is "sat" without "--uf-ss-totality" and timeout with it. It's not
; clear if this is the intended behavior.

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
 (forall ((a/43 G_append_))
    (and
     (= (append_ (proj_G_append__0 a/43) (proj_G_append__1 a/43))
      (ite (is-Cons_ (proj_G_append__0 a/43))
        (Cons_ (_select_Cons__0 (proj_G_append__0 a/43)) 
         (append_ (_select_Cons__1 (proj_G_append__0 a/43)) 
          (proj_G_append__1 a/43)))
        (proj_G_append__1 a/43))) 
     (ite (is-Cons_ (proj_G_append__0 a/43))
       (exists ((a/44 G_append_))
          (and (= (proj_G_append__1 a/43) (proj_G_append__1 a/44)) 
           (= (_select_Cons__1 (proj_G_append__0 a/43))
            (proj_G_append__0 a/44))))
       true))))
(declare-fun x_ () a_)
(declare-fun y_ () a_)
(declare-fun b_ () a_)
(declare-fun a1_ () a_)
(declare-sort G_rev_ 0)
(declare-fun __nun_card_witness_2 () G_rev_)
(declare-fun rev_ (list_) list_)
(declare-fun proj_G_rev__0 (G_rev_) list_)
(assert
 (forall ((a/45 G_rev_))
    (and
     (= (rev_ (proj_G_rev__0 a/45))
      (ite (is-Cons_ (proj_G_rev__0 a/45))
        (append_ (rev_ (_select_Cons__1 (proj_G_rev__0 a/45))) 
         (Cons_ (_select_Cons__0 (proj_G_rev__0 a/45)) Nil_))
        Nil_)) 
     (ite (is-Cons_ (proj_G_rev__0 a/45))
       (and
        (exists ((a/46 G_append_))
           (and
            (= (Cons_ (_select_Cons__0 (proj_G_rev__0 a/45)) Nil_)
             (proj_G_append__1 a/46)) 
            (= (rev_ (_select_Cons__1 (proj_G_rev__0 a/45)))
             (proj_G_append__0 a/46)))) 
        (exists ((a/47 G_rev_))
           (= (_select_Cons__1 (proj_G_rev__0 a/45)) (proj_G_rev__0 a/47))))
       true))))
(assert
 (and
  (not
   (=
    (rev_ (append_ (Cons_ a1_ (Cons_ b_ Nil_)) (Cons_ x_ (Cons_ y_ Nil_))))
    (append_ (Cons_ x_ (Cons_ y_ Nil_)) (Cons_ b_ (Cons_ a1_ Nil_))))) 
  (exists ((a/48 G_append_))
     (and (= (Cons_ x_ (Cons_ y_ Nil_)) (proj_G_append__1 a/48)) 
      (= (Cons_ a1_ (Cons_ b_ Nil_)) (proj_G_append__0 a/48)))) 
  (exists ((a/49 G_rev_))
     (= (append_ (Cons_ a1_ (Cons_ b_ Nil_)) (Cons_ x_ (Cons_ y_ Nil_)))
      (proj_G_rev__0 a/49))) 
  (exists ((a/50 G_append_))
     (and (= (Cons_ b_ (Cons_ a1_ Nil_)) (proj_G_append__1 a/50)) 
      (= (Cons_ x_ (Cons_ y_ Nil_)) (proj_G_append__0 a/50))))))
(check-sat)
