; outcome: unknown (after two seconds)
; expected: sat

; cvc4 --lang smt2 --finite-model-find --fmf-fun

; Why does CVC4 return unknown in FMF --fmf-fun?

(set-logic ALL_SUPPORTED)
(declare-sort elem 0)
(declare-datatypes () ((list (Nil) (Cons (hd elem) (tl list)))))
(define-fun-rec f ((x list)) elem
; This fails:
  (ite (is-Nil x) (f x) (hd x))
; This would work:
; (ite (is-Nil x) (f x) (f x))
; This would work too:
; (ite (is-Nil x) (hd x) (hd x))
)
(declare-fun t () elem)
(assert (= t (f Nil)))
(check-sat)
