(set-logic QF_S)
(declare-fun T_SELECT_15 () Bool)
(declare-fun T_a7 () Bool)
(declare-fun T_a8 () Bool)
(declare-fun I0_244 () Int)
(declare-fun I0_249 () Int)
(declare-fun I0_253 () Int)
(declare-fun I1_249 () Int)
(declare-fun I1_253 () Int)
(declare-fun I2_249 () Int)
(declare-fun I2_253 () Int)
(declare-fun PCTEMP_LHS_65 () Int)
(declare-fun T_ac () Int)
(declare-fun T0_244 () String)
(declare-fun T1_244 () String)
(declare-fun T2_244 () String)
(declare-fun T3_244 () String)
(declare-fun T4_244 () String)
(declare-fun T5_244 () String)
(declare-fun T_a5 () String)
(assert (= T_a5 (str.++ T0_244 T1_244)))
(assert (= T1_244 (str.++ T2_244 T3_244)))
(assert (= T2_244 (str.++ T4_244 T5_244)))
(assert (not (str.in.re T4_244 (str.to.re "="))))
(assert (= T5_244 "="))
(assert T_a8)
(assert (= T_a8 (not T_a7)))
(assert (= T_a7 (= PCTEMP_LHS_65 (- 1))))
(assert (= I0_249 (- PCTEMP_LHS_65 0)))
(assert (>= PCTEMP_LHS_65 0))
(assert (= I2_249 I1_249))
(assert (<= PCTEMP_LHS_65 I1_249))
(assert (>= I2_253 T_ac))
(assert (= I2_253 I1_253))
(assert (<= I2_253 I1_253))
(assert (= I0_253 (- I2_253 T_ac)))
(assert (>= T_ac 0))
(assert (= T_ac (+ PCTEMP_LHS_65 1)))
(assert (= PCTEMP_LHS_65 (+ I0_244 0)))
(assert (= T_SELECT_15 (not (= PCTEMP_LHS_65 (- 1)))))
(assert (= 0 (str.len T0_244))) ; len 0
(assert (= I0_244 (str.len T4_244))) ; len 1
(assert T_SELECT_15)
(check-sat)
