(set-logic QF_S)
(declare-fun T_1c () Bool)
(declare-fun T_1e () Bool)
(declare-fun T_1f () Bool)
(declare-fun T_SELECT_6 () Bool)
(declare-fun T_SELECT_7 () Bool)
(declare-fun I0_43 () Int)
(declare-fun I1_43 () Int)
(declare-fun I2_43 () Int)
(declare-fun PCTEMP_LHS_7 () Int)
(declare-fun PCTEMP_LHS_8 () Int)
(declare-fun T_20 () Int)
(declare-fun T_21 () Int)
(declare-fun T0_37 () String)
(declare-fun T1_37 () String)
(declare-fun var_0xINPUT_197803 () String)
(assert (= var_0xINPUT_197803 (str.++ T0_37 T1_37)))
(assert (not (str.in.re T1_37 (str.to.re ";"))))
(assert T_1f)
(assert (= T_1f (not T_1e)))
(assert (= T_1e (< PCTEMP_LHS_8 0)))
(assert (= T_SELECT_6 (not (= PCTEMP_LHS_7 (- 1)))))
(assert T_1c)
(assert (= T_1c (< (- 1) PCTEMP_LHS_7)))
(assert (= T_20 (+ PCTEMP_LHS_7 6)))
(assert (= T_21 (+ T_20 1)))
(assert (>= T_21 0))
(assert (>= PCTEMP_LHS_8 T_21))
(assert (= I0_43 (- PCTEMP_LHS_8 T_21)))
(assert (= I2_43 I1_43))
(assert (<= PCTEMP_LHS_8 I1_43))
(assert (= PCTEMP_LHS_8 (- 1)))
(assert (= T_SELECT_7 (not (= PCTEMP_LHS_8 (- 1)))))
(assert (= PCTEMP_LHS_7 (str.len T0_37))) ; len 0
(assert (not T_SELECT_7))
(check-sat)
