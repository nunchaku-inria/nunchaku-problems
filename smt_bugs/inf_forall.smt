; cvc4 --lang smt --finite-model-find

; outcome: timeout
; expected: sat (with y = zero)

(set-option :produce-models true)
(set-option :interactive-mode true)
(set-logic ALL_SUPPORTED)
(declare-datatypes () ((nat (Suc (pred nat)) (zero))))
(declare-fun y () nat)
(assert (forall ((x nat)) (not (= y (Suc x)))))
(check-sat)
