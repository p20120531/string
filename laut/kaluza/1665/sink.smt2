(set-logic QF_S)
(declare-fun T_SELECT_3 () Bool)
(declare-fun I0_6 () Int)
(declare-fun PCTEMP_LHS_3 () Int)
(declare-fun T0_6 () String)
(declare-fun T1_6 () String)
(declare-fun T2_6 () String)
(declare-fun T3_6 () String)
(declare-fun T4_6 () String)
(declare-fun T5_6 () String)
(declare-fun var_0xINPUT_8671 () String)
(assert (= var_0xINPUT_8671 (str.++ T0_6 T1_6)))
(assert (= T1_6 (str.++ T2_6 T3_6)))
(assert (= T2_6 (str.++ T4_6 T5_6)))
(assert (not (str.in.re T4_6 (str.to.re "__utmc=169413169"))))
(assert (= T5_6 "__utmc=169413169"))
(assert (= PCTEMP_LHS_3 (+ I0_6 0)))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_3 (- 1)))))
(assert (= 0 (str.len T0_6))) ; len 0
(assert (= I0_6 (str.len T4_6))) ; len 1
(assert T_SELECT_3)
(check-sat)
