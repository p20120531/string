(set-logic QF_S)
(declare-fun T_SELECT_4 () Bool)
(declare-fun T_c () Bool)
(declare-fun I0_15 () Int)
(declare-fun PCTEMP_LHS_4 () Int)
(declare-fun T0_15 () String)
(declare-fun T1_15 () String)
(declare-fun T2_15 () String)
(declare-fun T3_15 () String)
(declare-fun T4_15 () String)
(declare-fun T5_15 () String)
(declare-fun var_0xINPUT_15467 () String)
(assert (= var_0xINPUT_15467 (str.++ T0_15 T1_15)))
(assert (= T1_15 (str.++ T2_15 T3_15)))
(assert (= T2_15 (str.++ T4_15 T5_15)))
(assert (not (str.in.re T4_15 (str.to.re "__utmb=169413169"))))
(assert (= T5_15 "__utmb=169413169"))
(assert T_c)
(assert (= T_c (< (- 1) PCTEMP_LHS_4)))
(assert (= PCTEMP_LHS_4 (+ I0_15 0)))
(assert (= T_SELECT_4 (not (= PCTEMP_LHS_4 (- 1)))))
(assert (= 0 (str.len T0_15))) ; len 0
(assert (= I0_15 (str.len T4_15))) ; len 1
(assert T_SELECT_4)
(check-sat)
