(set-logic QF_S)
(declare-fun T_11 () Bool)
(declare-fun T_12 () Bool)
(declare-fun T_SELECT_4 () Bool)
(declare-fun PCTEMP_LHS_4 () Int)
(declare-fun T0_20 () String)
(declare-fun T1_20 () String)
(declare-fun var_0xINPUT_18338 () String)
(assert (= var_0xINPUT_18338 (str.++ T0_20 T1_20)))
(assert (not (str.in.re T1_20 (str.to.re "__utma=16886264."))))
(assert T_12)
(assert (= T_12 (not T_11)))
(assert (= T_11 (< (- 1) PCTEMP_LHS_4)))
(assert (= PCTEMP_LHS_4 (- 1)))
(assert (= T_SELECT_4 (not (= PCTEMP_LHS_4 (- 1)))))
(assert (= 0 (str.len T0_20))) ; len 0
(assert (not T_SELECT_4))
(check-sat)
