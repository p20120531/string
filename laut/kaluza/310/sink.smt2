(set-logic QF_S)
(declare-fun T_59 () Bool)
(declare-fun T_5a () Bool)
(declare-fun T_SELECT_9 () Bool)
(declare-fun I0_130 () Int)
(declare-fun I0_135 () Int)
(declare-fun I0_139 () Int)
(declare-fun I1_135 () Int)
(declare-fun I1_139 () Int)
(declare-fun I2_135 () Int)
(declare-fun I2_139 () Int)
(declare-fun PCTEMP_LHS_35 () Int)
(declare-fun T_5e () Int)
(declare-fun T0_130 () String)
(declare-fun T1_130 () String)
(declare-fun T2_130 () String)
(declare-fun T3_130 () String)
(declare-fun T4_130 () String)
(declare-fun T5_130 () String)
(declare-fun T_57 () String)
(assert (= T_57 (str.++ T0_130 T1_130)))
(assert (= T1_130 (str.++ T2_130 T3_130)))
(assert (= T2_130 (str.++ T4_130 T5_130)))
(assert (not (str.in.re T4_130 (str.to.re "="))))
(assert (= T5_130 "="))
(assert T_5a)
(assert (= T_5a (not T_59)))
(assert (= T_59 (= PCTEMP_LHS_35 (- 1))))
(assert (= I0_135 (- PCTEMP_LHS_35 0)))
(assert (>= PCTEMP_LHS_35 0))
(assert (= I2_135 I1_135))
(assert (<= PCTEMP_LHS_35 I1_135))
(assert (>= I2_139 T_5e))
(assert (= I2_139 I1_139))
(assert (<= I2_139 I1_139))
(assert (= I0_139 (- I2_139 T_5e)))
(assert (>= T_5e 0))
(assert (= T_5e (+ PCTEMP_LHS_35 1)))
(assert (= PCTEMP_LHS_35 (+ I0_130 0)))
(assert (= T_SELECT_9 (not (= PCTEMP_LHS_35 (- 1)))))
(assert (= 0 (str.len T0_130))) ; len 0
(assert (= I0_130 (str.len T4_130))) ; len 1
(assert T_SELECT_9)
(check-sat)
