(set-logic QF_S)
(declare-fun T_SELECT_21 () Bool)
(declare-fun T_f5 () Bool)
(declare-fun T_f6 () Bool)
(declare-fun I0_358 () Int)
(declare-fun I0_363 () Int)
(declare-fun I0_367 () Int)
(declare-fun I1_363 () Int)
(declare-fun I1_367 () Int)
(declare-fun I2_363 () Int)
(declare-fun I2_367 () Int)
(declare-fun PCTEMP_LHS_95 () Int)
(declare-fun T_fa () Int)
(declare-fun T0_358 () String)
(declare-fun T1_358 () String)
(declare-fun T2_358 () String)
(declare-fun T3_358 () String)
(declare-fun T4_358 () String)
(declare-fun T5_358 () String)
(declare-fun T_f3 () String)
(assert (= T_f3 (str.++ T0_358 T1_358)))
(assert (= T1_358 (str.++ T2_358 T3_358)))
(assert (= T2_358 (str.++ T4_358 T5_358)))
(assert (not (str.in.re T4_358 (str.to.re "="))))
(assert (= T5_358 "="))
(assert T_f6)
(assert (= T_f6 (not T_f5)))
(assert (= T_f5 (= PCTEMP_LHS_95 (- 1))))
(assert (= I0_363 (- PCTEMP_LHS_95 0)))
(assert (>= PCTEMP_LHS_95 0))
(assert (= I2_363 I1_363))
(assert (<= PCTEMP_LHS_95 I1_363))
(assert (>= I2_367 T_fa))
(assert (= I2_367 I1_367))
(assert (<= I2_367 I1_367))
(assert (= I0_367 (- I2_367 T_fa)))
(assert (>= T_fa 0))
(assert (= T_fa (+ PCTEMP_LHS_95 1)))
(assert (= PCTEMP_LHS_95 (+ I0_358 0)))
(assert (= T_SELECT_21 (not (= PCTEMP_LHS_95 (- 1)))))
(assert (= 0 (str.len T0_358))) ; len 0
(assert (= I0_358 (str.len T4_358))) ; len 1
(assert T_SELECT_21)
(check-sat)
