(set-logic QF_S)
(declare-fun T_SELECT_3 () Bool)
(declare-fun T_b () Bool)
(declare-fun T_c () Bool)
(declare-fun I0_21 () Int)
(declare-fun I0_25 () Int)
(declare-fun I1_21 () Int)
(declare-fun I1_25 () Int)
(declare-fun I2_21 () Int)
(declare-fun I2_25 () Int)
(declare-fun PCTEMP_LHS_5 () Int)
(declare-fun T_10 () Int)
(declare-fun NEW_DGNode_1048 () String)
(declare-fun NEW_DGNode_1049 () String)
(declare-fun PCTEMP_LHS_9 () String)
(assert (= PCTEMP_LHS_9 NEW_DGNode_1049))
(assert (= NEW_DGNode_1049 NEW_DGNode_1048))
(assert (not (str.in.re NEW_DGNode_1049 (str.to.re "+"))))
(assert (not (str.in.re NEW_DGNode_1048 (str.to.re "%"))))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_5 (- 1)))))
(assert T_c)
(assert (= T_c (not T_b)))
(assert (= T_b (= PCTEMP_LHS_5 (- 1))))
(assert (= I0_21 (- PCTEMP_LHS_5 0)))
(assert (>= PCTEMP_LHS_5 0))
(assert (= I2_21 I1_21))
(assert (<= PCTEMP_LHS_5 I1_21))
(assert (= T_10 (+ PCTEMP_LHS_5 1)))
(assert (>= T_10 0))
(assert (>= I2_25 T_10))
(assert (= I2_25 I1_25))
(assert (<= I2_25 I1_25))
(assert (= I0_25 (- I2_25 T_10)))
(assert (= I0_25 (str.len PCTEMP_LHS_9))) ; len 0
(check-sat)
