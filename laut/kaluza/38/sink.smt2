(set-logic QF_S)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun T0_2 () String)
(declare-fun T1_2 () String)
(declare-fun var_0xINPUT_4665 () String)
(assert (= var_0xINPUT_4665 (str.++ T0_2 T1_2)))
(assert (not (str.in.re T1_2 (str.to.re "&debug=1"))))
(assert T_3)
(assert (= T_3 (not T_2)))
(assert (= T_2 (= PCTEMP_LHS_1 (- 1))))
(assert (= PCTEMP_LHS_1 (- 1)))
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (= 0 (str.len T0_2))) ; len 0
(assert (not T_SELECT_1))
(check-sat)
