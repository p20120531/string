(set-logic QF_S)
(declare-fun T_8 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun I0_2 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun T0_2 () String)
(declare-fun T1_2 () String)
(declare-fun T2_2 () String)
(declare-fun T3_2 () String)
(declare-fun T4_2 () String)
(declare-fun T5_2 () String)
(declare-fun var_0xINPUT_41912 () String)
(assert (= var_0xINPUT_41912 (str.++ T0_2 T1_2)))
(assert (= T1_2 (str.++ T2_2 T3_2)))
(assert (= T2_2 (str.++ T4_2 T5_2)))
(assert (not (str.in.re T4_2 (str.to.re "__utma=218069774."))))
(assert (= T5_2 "__utma=218069774."))
(assert T_8)
(assert (= T_8 (< (- 1) PCTEMP_LHS_1)))
(assert (= PCTEMP_LHS_1 (+ I0_2 0)))
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (= 0 (str.len T0_2))) ; len 0
(assert (= I0_2 (str.len T4_2))) ; len 1
(assert T_SELECT_1)
(check-sat)
