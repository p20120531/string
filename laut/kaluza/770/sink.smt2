(set-logic QF_S)
(declare-fun T_SELECT_2 () Bool)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun T0_4 () String)
(declare-fun T1_4 () String)
(declare-fun var_0xINPUT_95190 () String)
(assert (= var_0xINPUT_95190 (str.++ T0_4 T1_4)))
(assert (not (str.in.re T1_4 (str.to.re "__utmb=16886264"))))
(assert (= PCTEMP_LHS_2 (- 1)))
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (= 0 (str.len T0_4))) ; len 0
(assert (not T_SELECT_2))
(check-sat)
