(set-logic QF_S)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun T0_6 () String)
(declare-fun T1_6 () String)
(declare-fun var_0xINPUT_119325 () String)
(assert (= var_0xINPUT_119325 (str.++ T0_6 T1_6)))
(assert (not (str.in.re T1_6 (str.to.re "__utma=16886264."))))
(assert T_7)
(assert (= T_7 (not T_6)))
(assert (= T_6 (< (- 1) PCTEMP_LHS_1)))
(assert (= PCTEMP_LHS_1 (- 1)))
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (= 0 (str.len T0_6))) ; len 0
(assert (not T_SELECT_1))
(check-sat)
