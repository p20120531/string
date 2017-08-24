(set-logic QF_S)
(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_5 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_8 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun I0_14 () Int)
(declare-fun I1_14 () Int)
(declare-fun I2_14 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun T_9 () Int)
(declare-fun T_a () Int)
(declare-fun NEW_DGNode_5 () String)
(declare-fun NEW_DGNode_6 () String)
(declare-fun NEW_DGNode_8 () String)
(declare-fun NEW_DGNode_9 () String)
(declare-fun PCTEMP_LHS_3 () String)
(declare-fun T1_14 () String)
(declare-fun T2_14 () String)
(declare-fun T3_14 () String)
(declare-fun var_0xINPUT_100738 () String)
(assert (= var_0xINPUT_100738 NEW_DGNode_8))
(assert (= NEW_DGNode_8 NEW_DGNode_9))
(assert (= NEW_DGNode_8 NEW_DGNode_5))
(assert (= NEW_DGNode_5 NEW_DGNode_6))
(assert (= NEW_DGNode_5 ""))
(assert (= NEW_DGNode_6 "-"))
(assert (= NEW_DGNode_9 (str.++ T1_14 T2_14)))
(assert (= T2_14 (str.++ PCTEMP_LHS_3 T3_14)))
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert T_8)
(assert (= T_8 (not T_7)))
(assert (= T_7 (< PCTEMP_LHS_2 0)))
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert T_5)
(assert (= T_5 (< (- 1) PCTEMP_LHS_1)))
(assert (= T_9 (+ PCTEMP_LHS_1 6)))
(assert (= T_a (+ T_9 1)))
(assert (>= T_a 0))
(assert (>= PCTEMP_LHS_2 T_a))
(assert (= I0_14 (- PCTEMP_LHS_2 T_a)))
(assert (<= PCTEMP_LHS_2 I1_14))
(assert (= I2_14 I1_14))
(assert (= I1_14 (str.len var_0xINPUT_100738))) ; len 0
(assert T_1)
(assert T_2)
(assert (= T_2 (not T_1)))
(assert T_3)
(assert (= T_a (str.len T1_14))) ; len 1
(assert (= I0_14 (str.len PCTEMP_LHS_3))) ; len 2
(check-sat)
