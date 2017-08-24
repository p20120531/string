(set-logic QF_S)
(declare-fun T_SELECT_21 () Bool)
(declare-fun T_f5 () Bool)
(declare-fun T_f6 () Bool)
(declare-fun I0_363 () Int)
(declare-fun I0_367 () Int)
(declare-fun I1_363 () Int)
(declare-fun I1_367 () Int)
(declare-fun I2_363 () Int)
(declare-fun I2_367 () Int)
(declare-fun PCTEMP_LHS_95 () Int)
(declare-fun T_fa () Int)
(declare-fun NEW_DGNode_582 () String)
(declare-fun NEW_DGNode_583 () String)
(declare-fun NEW_DGNode_780 () String)
(declare-fun NEW_DGNode_781 () String)
(declare-fun PCTEMP_LHS_100 () String)
(declare-fun PCTEMP_LHS_96 () String)
(declare-fun T1_363 () String)
(declare-fun T1_367 () String)
(declare-fun T2_363 () String)
(declare-fun T2_367 () String)
(declare-fun T3_363 () String)
(declare-fun T3_367 () String)
(declare-fun T_f9 () String)
(assert (= T_f9 NEW_DGNode_582))
(assert (= NEW_DGNode_582 NEW_DGNode_583))
(assert (= NEW_DGNode_582 (str.++ T1_363 T2_363)))
(assert (= T2_363 (str.++ PCTEMP_LHS_96 T3_363)))
(assert (= NEW_DGNode_583 (str.++ T1_367 T2_367)))
(assert (= T2_367 (str.++ PCTEMP_LHS_100 T3_367)))
(assert (= PCTEMP_LHS_100 NEW_DGNode_781))
(assert (= NEW_DGNode_781 NEW_DGNode_780))
(assert (not (str.in.re NEW_DGNode_781 (str.to.re "+"))))
(assert (not (str.in.re NEW_DGNode_780 (str.to.re "%"))))
(assert (= T_SELECT_21 (not (= PCTEMP_LHS_95 (- 1)))))
(assert T_f6)
(assert (= T_f6 (not T_f5)))
(assert (= T_f5 (= PCTEMP_LHS_95 (- 1))))
(assert (= I0_363 (- PCTEMP_LHS_95 0)))
(assert (>= PCTEMP_LHS_95 0))
(assert (>= I2_367 T_fa))
(assert (= I2_367 I1_367))
(assert (<= I2_367 I1_367))
(assert (= I0_367 (- I2_367 T_fa)))
(assert (>= T_fa 0))
(assert (= T_fa (+ PCTEMP_LHS_95 1)))
(assert (<= PCTEMP_LHS_95 I1_363))
(assert (= I2_363 I1_363))
(assert (= I1_363 (str.len T_f9))) ; len 0
(assert (= I1_367 (str.len T_f9))) ; len 0
(assert (= 0 (str.len T1_363))) ; len 1
(assert (= I0_363 (str.len PCTEMP_LHS_96))) ; len 2
(assert (= T_fa (str.len T1_367))) ; len 3
(assert (= I0_367 (str.len PCTEMP_LHS_100))) ; len 4
(check-sat)
