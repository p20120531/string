(set-logic QF_S)
(declare-fun T_4c () Bool)
(declare-fun T_4d () Bool)
(declare-fun T_SELECT_8 () Bool)
(declare-fun I0_116 () Int)
(declare-fun I0_120 () Int)
(declare-fun I1_116 () Int)
(declare-fun I1_120 () Int)
(declare-fun I2_116 () Int)
(declare-fun I2_120 () Int)
(declare-fun PCTEMP_LHS_30 () Int)
(declare-fun T_51 () Int)
(declare-fun NEW_DGNode_1538 () String)
(declare-fun NEW_DGNode_1539 () String)
(declare-fun PCTEMP_LHS_34 () String)
(assert (= PCTEMP_LHS_34 NEW_DGNode_1539))
(assert (= NEW_DGNode_1539 NEW_DGNode_1538))
(assert (not (str.in.re NEW_DGNode_1539 (str.to.re "+"))))
(assert (not (str.in.re NEW_DGNode_1538 (str.to.re "%"))))
(assert (= T_SELECT_8 (not (= PCTEMP_LHS_30 (- 1)))))
(assert T_4d)
(assert (= T_4d (not T_4c)))
(assert (= T_4c (= PCTEMP_LHS_30 (- 1))))
(assert (= I0_116 (- PCTEMP_LHS_30 0)))
(assert (>= PCTEMP_LHS_30 0))
(assert (= I2_116 I1_116))
(assert (<= PCTEMP_LHS_30 I1_116))
(assert (= T_51 (+ PCTEMP_LHS_30 1)))
(assert (>= T_51 0))
(assert (>= I2_120 T_51))
(assert (= I2_120 I1_120))
(assert (<= I2_120 I1_120))
(assert (= I0_120 (- I2_120 T_51)))
(assert (= I0_120 (str.len PCTEMP_LHS_34))) ; len 0
(check-sat)