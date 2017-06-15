(set-logic QF_S)
(set-option :produce-models true)


(declare-fun v1 () String)
(declare-fun v3 () String)
(declare-fun i1 () Int)
(declare-fun i2 () Int)


(assert (= v1 "abcdef"))
(assert (= v3 (str.substr v1 1 1)))
(assert (str.in.re v3 (re.* (str.to.re "b"))))
(assert (= i1 (str.len v3)))
(assert (= i2 (str.len v1)))

(check-sat)
(get-model)