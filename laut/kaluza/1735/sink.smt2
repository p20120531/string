(set-logic QF_S)
(declare-fun T_SELECT_3 () Bool)
(declare-fun PCTEMP_LHS_3 () Int)
(declare-fun T0_6 () String)
(declare-fun T1_6 () String)
(declare-fun var_0xINPUT_40071 () String)
(assert (= var_0xINPUT_40071 (str.++ T0_6 T1_6)))
(assert (not (str.in.re T1_6 (str.to.re "__utmc=218069774"))))
(assert (= PCTEMP_LHS_3 (- 1)))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_3 (- 1)))))
(assert (= 0 (str.len T0_6))) ; len 0
(assert (not T_SELECT_3))
(check-sat)
