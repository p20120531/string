(set-logic QF_S)
(declare-fun T_1d () Bool)
(declare-fun T_SELECT_3 () Bool)
(declare-fun PCTEMP_LHS_3 () Int)
(declare-fun T0_40 () String)
(declare-fun T1_40 () String)
(declare-fun T_1b () String)
(assert (= T_1b (str.++ T0_40 T1_40)))
(assert (not (str.in.re T1_40 (str.to.re "gclid="))))
(assert T_1d)
(assert (= T_1d (< (- 1) PCTEMP_LHS_3)))
(assert (= PCTEMP_LHS_3 (- 1)))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_3 (- 1)))))
(assert (= 0 (str.len T0_40))) ; len 0
(assert (not T_SELECT_3))
(check-sat)