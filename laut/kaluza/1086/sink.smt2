(set-logic QF_S)
(declare-fun T_12 () Bool)
(declare-fun T_13 () Bool)
(declare-fun T_SELECT_4 () Bool)
(declare-fun T_SELECT_5 () Bool)
(declare-fun T_a5 () Bool)
(declare-fun T_a6 () Bool)
(declare-fun T_c () Bool)
(declare-fun T_e () Bool)
(declare-fun T_f () Bool)
(declare-fun I0_23 () Int)
(declare-fun I1_23 () Int)
(declare-fun I2_23 () Int)
(declare-fun PCTEMP_LHS_4 () Int)
(declare-fun PCTEMP_LHS_5 () Int)
(declare-fun T_10 () Int)
(declare-fun NEW_DGNode_459 () String)
(declare-fun NEW_DGNode_463 () String)
(declare-fun NEW_DGNode_467 () String)
(declare-fun NEW_DGNode_471 () String)
(declare-fun NEW_DGNode_475 () String)
(declare-fun NEW_DGNode_479 () String)
(declare-fun NEW_DGNode_483 () String)
(declare-fun NEW_DGNode_484 () String)
(declare-fun PCTEMP_LHS_6 () String)
(declare-fun T_9f () String)
(declare-fun T_a0 () String)
(declare-fun T_a1 () String)
(declare-fun T_a2 () String)
(declare-fun T_a3 () String)
(declare-fun T_a4 () String)
(assert (= T_a4 NEW_DGNode_483))
(assert (= NEW_DGNode_483 NEW_DGNode_484))
(assert (= NEW_DGNode_483 (str.++ T_a3 NEW_DGNode_479)))
(assert (= T_a3 (str.++ T_a2 NEW_DGNode_475)))
(assert (= T_a2 (str.++ T_a1 NEW_DGNode_471)))
(assert (= T_a1 (str.++ T_a0 NEW_DGNode_467)))
(assert (= T_a0 (str.++ T_9f NEW_DGNode_463)))
(assert (= T_9f (str.++ NEW_DGNode_459 PCTEMP_LHS_6)))
(assert (= NEW_DGNode_459 "__utmb="))
(assert (= PCTEMP_LHS_6 "-"))
(assert (= NEW_DGNode_463 ";"))
(assert (= NEW_DGNode_467 "/"))
(assert (= NEW_DGNode_471 ";"))
(assert (= NEW_DGNode_475 ""))
(assert (= NEW_DGNode_479 ""))
(assert (= NEW_DGNode_484 ""))
(assert T_a5)
(assert T_a6)
(assert (= T_a6 (not T_a5)))
(assert (= T_SELECT_5 (not (= PCTEMP_LHS_5 (- 1)))))
(assert T_f)
(assert (= T_f (not T_e)))
(assert (= T_e (< PCTEMP_LHS_5 0)))
(assert (= T_SELECT_4 (not (= PCTEMP_LHS_4 (- 1)))))
(assert T_c)
(assert (= T_c (< (- 1) PCTEMP_LHS_4)))
(assert (= T_10 (+ PCTEMP_LHS_4 7)))
(assert (>= T_10 0))
(assert (>= PCTEMP_LHS_5 T_10))
(assert (= I2_23 I1_23))
(assert (<= PCTEMP_LHS_5 I1_23))
(assert (= I0_23 (- PCTEMP_LHS_5 T_10)))
(assert (= I0_23 (str.len PCTEMP_LHS_6))) ; len 0
(assert T_12)
(assert T_13)
(assert (= T_13 (not T_12)))
(check-sat)
