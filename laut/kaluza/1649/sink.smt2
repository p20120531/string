(set-logic QF_S)
(declare-fun T_SELECT_18 () Bool)
(declare-fun T_ce () Bool)
(declare-fun T_cf () Bool)
(declare-fun I0_306 () Int)
(declare-fun I0_310 () Int)
(declare-fun I1_306 () Int)
(declare-fun I1_310 () Int)
(declare-fun I2_306 () Int)
(declare-fun I2_310 () Int)
(declare-fun PCTEMP_LHS_80 () Int)
(declare-fun T_d3 () Int)
(declare-fun T0_301 () String)
(declare-fun T1_301 () String)
(declare-fun T_cc () String)
(assert (= T_cc (str.++ T0_301 T1_301)))
(assert (not (str.in.re T1_301 (str.to.re "="))))
(assert T_cf)
(assert (= T_cf (not T_ce)))
(assert (= T_ce (= PCTEMP_LHS_80 (- 1))))
(assert (= I0_306 (- PCTEMP_LHS_80 0)))
(assert (>= PCTEMP_LHS_80 0))
(assert (= I2_306 I1_306))
(assert (<= PCTEMP_LHS_80 I1_306))
(assert (>= I2_310 T_d3))
(assert (= I2_310 I1_310))
(assert (<= I2_310 I1_310))
(assert (= I0_310 (- I2_310 T_d3)))
(assert (>= T_d3 0))
(assert (= T_d3 (+ PCTEMP_LHS_80 1)))
(assert (= PCTEMP_LHS_80 (- 1)))
(assert (= T_SELECT_18 (not (= PCTEMP_LHS_80 (- 1)))))
(assert (= 0 (str.len T0_301))) ; len 0
(assert (not T_SELECT_18))
(check-sat)
