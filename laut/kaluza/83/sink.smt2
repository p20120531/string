(set-logic QF_S)
(declare-fun T_25 () Bool)
(declare-fun T_SELECT_5 () Bool)
(declare-fun PCTEMP_LHS_15 () Int)
(declare-fun T0_54 () String)
(declare-fun T1_54 () String)
(declare-fun T_23 () String)
(assert (= T_23 (str.++ T0_54 T1_54)))
(assert (not (str.in.re T1_54 (str.to.re "="))))
(assert T_25)
(assert (= T_25 (= PCTEMP_LHS_15 (- 1))))
(assert (= PCTEMP_LHS_15 (- 1)))
(assert (= T_SELECT_5 (not (= PCTEMP_LHS_15 (- 1)))))
(assert (= 0 (str.len T0_54))) ; len 0
(assert (not T_SELECT_5))
(check-sat)
