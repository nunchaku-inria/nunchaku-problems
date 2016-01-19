; outcome: timeout
; expected: sat within 1 s (see also comment near the end of the file)

; cvc4 --finite-model-find --fmf-fun slow_rev.smt2 

(set-option :produce-models true)
(set-option :interactive-mode true)
(set-logic ALL_SUPPORTED)
(declare-sort a 0)
(declare-datatypes () ((prod (Pair (_select_Pair_0 a) (_select_Pair_1 a)))))
(declare-datatypes ()
   ((plist (PCons (_select_PCons_0 prod) (_select_PCons_1 plist)) (PNil ))))
(declare-datatypes ()
   ((list (Cons (_select_Cons_0 a) (_select_Cons_1 list)) (Nil ))))
(define-fun-rec zip ((xs/64 list) (ys/65 list)) plist
  (ite (is-Cons xs/64)
    (ite (is-Cons ys/65)
      (PCons (Pair (_select_Cons_0 xs/64) (_select_Cons_0 ys/65)) 
       (zip (_select_Cons_1 xs/64) (_select_Cons_1 ys/65)))
      PNil)
    PNil))
(define-fun-rec append ((xs/66 list) (ys/67 list)) list
  (ite (is-Cons xs/66)
    (Cons (_select_Cons_0 xs/66) 
     (append (_select_Cons_1 xs/66) ys/67))
    ys/67))
(define-fun-rec rev ((xs/68 list)) list
  (ite (is-Cons xs/68)
    (append (rev (_select_Cons_1 xs/68)) 
     (Cons (_select_Cons_0 xs/68) Nil))
    Nil))

(declare-fun xs () list)
(declare-fun ys () list)
(declare-fun y () a)
(declare-fun x () a)
(assert (not (= x y)))

; The problem becomes easy with the following line:
; (assert (= xs (Cons y Nil)))
(assert (not (= (zip (Cons x xs) ys) (zip (rev (Cons x xs)) (rev ys)))))
(check-sat)
