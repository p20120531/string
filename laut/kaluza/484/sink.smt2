(set-logic QF_S)
(declare-fun T_2b () Bool)
(declare-fun T_2c () Bool)
(declare-fun T_SELECT_6 () Bool)
(declare-fun PCTEMP_LHS_10 () Int)
(declare-fun T0_57 () String)
(declare-fun T1_57 () String)
(declare-fun var_0xINPUT_17482 () String)
(assert (= var_0xINPUT_17482 (str.++ T0_57 T1_57)))
(assert (not (str.in.re T1_57 (str.to.re "__utmv=169413169."))))
(assert T_2c)
(assert (= T_2c (not T_2b)))
(assert (= T_2b (< (- 1) PCTEMP_LHS_10)))
(assert (= PCTEMP_LHS_10 (- 1)))
(assert (= T_SELECT_6 (not (= PCTEMP_LHS_10 (- 1)))))
(assert (= 0 (str.len T0_57))) ; len 0
(assert (not T_SELECT_6))
(check-sat)
