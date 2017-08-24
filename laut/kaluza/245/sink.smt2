(set-logic QF_S)
(declare-fun T_73 () Bool)
(declare-fun T_74 () Bool)
(declare-fun T_SELECT_11 () Bool)
(declare-fun I0_168 () Int)
(declare-fun I0_173 () Int)
(declare-fun I0_177 () Int)
(declare-fun I1_173 () Int)
(declare-fun I1_177 () Int)
(declare-fun I2_173 () Int)
(declare-fun I2_177 () Int)
(declare-fun PCTEMP_LHS_45 () Int)
(declare-fun T_78 () Int)
(declare-fun T0_168 () String)
(declare-fun T1_168 () String)
(declare-fun T2_168 () String)
(declare-fun T3_168 () String)
(declare-fun T4_168 () String)
(declare-fun T5_168 () String)
(declare-fun T_71 () String)
(assert (= T_71 (str.++ T0_168 T1_168)))
(assert (= T1_168 (str.++ T2_168 T3_168)))
(assert (= T2_168 (str.++ T4_168 T5_168)))
(assert (not (str.in.re T4_168 (str.to.re "="))))
(assert (= T5_168 "="))
(assert T_74)
(assert (= T_74 (not T_73)))
(assert (= T_73 (= PCTEMP_LHS_45 (- 1))))
(assert (= I0_173 (- PCTEMP_LHS_45 0)))
(assert (>= PCTEMP_LHS_45 0))
(assert (= I2_173 I1_173))
(assert (<= PCTEMP_LHS_45 I1_173))
(assert (>= I2_177 T_78))
(assert (= I2_177 I1_177))
(assert (<= I2_177 I1_177))
(assert (= I0_177 (- I2_177 T_78)))
(assert (>= T_78 0))
(assert (= T_78 (+ PCTEMP_LHS_45 1)))
(assert (= PCTEMP_LHS_45 (+ I0_168 0)))
(assert (= T_SELECT_11 (not (= PCTEMP_LHS_45 (- 1)))))
(assert (= 0 (str.len T0_168))) ; len 0
(assert (= I0_168 (str.len T4_168))) ; len 1
(assert T_SELECT_11)
(check-sat)
