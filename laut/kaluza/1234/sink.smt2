(set-logic QF_S)
(declare-fun T_1a () Bool)
(declare-fun T_1b () Bool)
(declare-fun T_SELECT_3 () Bool)
(declare-fun PCTEMP_LHS_3 () Int)
(declare-fun T0_37 () String)
(declare-fun T1_37 () String)
(declare-fun T_18 () String)
(assert (= T_18 (str.++ T0_37 T1_37)))
(assert (not (str.in.re T1_37 (str.to.re "gclid="))))
(assert T_1b)
(assert (= T_1b (not T_1a)))
(assert (= T_1a (< (- 1) PCTEMP_LHS_3)))
(assert (= PCTEMP_LHS_3 (- 1)))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_3 (- 1)))))
(assert (= 0 (str.len T0_37))) ; len 0
(assert (not T_SELECT_3))
(check-sat)
