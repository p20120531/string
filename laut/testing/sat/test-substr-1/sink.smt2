(set-logic QF_S)


(declare-fun v1 () String)
(declare-fun v3 () String)
(declare-fun i1 () Int)
(declare-fun i2 () Int)


(assert (= v1 "abcdef"))
(assert (= v3 (str.substr v1 0 6)))
(assert (= i1 (str.len v3)))
(assert (= i2 (str.len v1)))

(check-sat)
