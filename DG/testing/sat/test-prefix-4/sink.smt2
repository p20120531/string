(set-logic QF_S)
(set-option :produce-models true)


(declare-fun v1 () String)


(assert (= v1 "abc"))
(assert (= 3 (str.len v1)))
(assert (str.prefixof v1 "abc"))

(check-sat)
(get-model)