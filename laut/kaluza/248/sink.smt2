(set-logic QF_S)
(declare-fun T_SELECT_15 () Bool)
(declare-fun T_a7 () Bool)
(declare-fun T_a8 () Bool)
(declare-fun I0_249 () Int)
(declare-fun I0_253 () Int)
(declare-fun I1_249 () Int)
(declare-fun I1_253 () Int)
(declare-fun I2_249 () Int)
(declare-fun I2_253 () Int)
(declare-fun PCTEMP_LHS_65 () Int)
(declare-fun T_ac () Int)
(declare-fun NEW_DGNode_450 () String)
(declare-fun NEW_DGNode_451 () String)
(declare-fun NEW_DGNode_624 () String)
(declare-fun NEW_DGNode_625 () String)
(declare-fun NEW_DGNode_738 () String)
(declare-fun NEW_DGNode_739 () String)
(declare-fun PCTEMP_LHS_66 () String)
(declare-fun PCTEMP_LHS_69 () String)
(declare-fun T1_249 () String)
(declare-fun T1_253 () String)
(declare-fun T2_249 () String)
(declare-fun T2_253 () String)
(declare-fun T3_249 () String)
(declare-fun T3_253 () String)
(declare-fun T_ab () String)
(assert (= T_ab NEW_DGNode_625))
(assert (= NEW_DGNode_625 NEW_DGNode_624))
(assert (= NEW_DGNode_625 NEW_DGNode_450))
(assert (= NEW_DGNode_450 NEW_DGNode_451))
(assert (= NEW_DGNode_450 (str.++ T1_249 T2_249)))
(assert (= T2_249 (str.++ PCTEMP_LHS_66 T3_249)))
(assert (= NEW_DGNode_451 (str.++ T1_253 T2_253)))
(assert (= T2_253 (str.++ PCTEMP_LHS_69 T3_253)))
(assert (= PCTEMP_LHS_69 NEW_DGNode_739))
(assert (= NEW_DGNode_739 NEW_DGNode_738))
(assert (not (str.in.re NEW_DGNode_739 (str.to.re "+"))))
(assert (not (str.in.re NEW_DGNode_738 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_624 (str.to.re "&"))))
(assert (= T_SELECT_15 (not (= PCTEMP_LHS_65 (- 1)))))
(assert T_a8)
(assert (= T_a8 (not T_a7)))
(assert (= T_a7 (= PCTEMP_LHS_65 (- 1))))
(assert (= I0_249 (- PCTEMP_LHS_65 0)))
(assert (>= PCTEMP_LHS_65 0))
(assert (>= I2_253 T_ac))
(assert (= I2_253 I1_253))
(assert (<= I2_253 I1_253))
(assert (= I0_253 (- I2_253 T_ac)))
(assert (>= T_ac 0))
(assert (= T_ac (+ PCTEMP_LHS_65 1)))
(assert (<= PCTEMP_LHS_65 I1_249))
(assert (= I2_249 I1_249))
(assert (= I1_249 (str.len T_ab))) ; len 0
(assert (= I1_253 (str.len T_ab))) ; len 0
(assert (= 0 (str.len T1_249))) ; len 1
(assert (= I0_249 (str.len PCTEMP_LHS_66))) ; len 2
(assert (= T_ac (str.len T1_253))) ; len 3
(assert (= I0_253 (str.len PCTEMP_LHS_69))) ; len 4
(check-sat)
