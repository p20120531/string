(set-logic QF_S)
(declare-fun T_18 () Bool)
(declare-fun T_19 () Bool)
(declare-fun T_SELECT_4 () Bool)
(declare-fun I0_40 () Int)
(declare-fun I0_44 () Int)
(declare-fun I1_40 () Int)
(declare-fun I1_44 () Int)
(declare-fun I2_40 () Int)
(declare-fun I2_44 () Int)
(declare-fun PCTEMP_LHS_10 () Int)
(declare-fun T_1d () Int)
(declare-fun NEW_DGNode_271 () String)
(declare-fun NEW_DGNode_272 () String)
(declare-fun NEW_DGNode_352 () String)
(declare-fun NEW_DGNode_353 () String)
(declare-fun NEW_DGNode_367 () String)
(declare-fun NEW_DGNode_368 () String)
(declare-fun PCTEMP_LHS_11 () String)
(declare-fun PCTEMP_LHS_14 () String)
(declare-fun T1_40 () String)
(declare-fun T1_44 () String)
(declare-fun T2_40 () String)
(declare-fun T2_44 () String)
(declare-fun T3_40 () String)
(declare-fun T3_44 () String)
(declare-fun T_1c () String)
(assert (= T_1c NEW_DGNode_353))
(assert (= NEW_DGNode_353 NEW_DGNode_352))
(assert (= NEW_DGNode_353 NEW_DGNode_271))
(assert (= NEW_DGNode_271 NEW_DGNode_272))
(assert (= NEW_DGNode_271 (str.++ T1_40 T2_40)))
(assert (= T2_40 (str.++ PCTEMP_LHS_11 T3_40)))
(assert (= NEW_DGNode_272 (str.++ T1_44 T2_44)))
(assert (= T2_44 (str.++ PCTEMP_LHS_14 T3_44)))
(assert (= PCTEMP_LHS_14 NEW_DGNode_368))
(assert (= NEW_DGNode_368 NEW_DGNode_367))
(assert (not (str.in.re NEW_DGNode_368 (str.to.re "+"))))
(assert (not (str.in.re NEW_DGNode_367 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_352 (str.to.re "&"))))
(assert (= T_SELECT_4 (not (= PCTEMP_LHS_10 (- 1)))))
(assert T_19)
(assert (= T_19 (not T_18)))
(assert (= T_18 (= PCTEMP_LHS_10 (- 1))))
(assert (= I0_40 (- PCTEMP_LHS_10 0)))
(assert (>= PCTEMP_LHS_10 0))
(assert (>= I2_44 T_1d))
(assert (= I2_44 I1_44))
(assert (<= I2_44 I1_44))
(assert (= I0_44 (- I2_44 T_1d)))
(assert (>= T_1d 0))
(assert (= T_1d (+ PCTEMP_LHS_10 1)))
(assert (<= PCTEMP_LHS_10 I1_40))
(assert (= I2_40 I1_40))
(assert (= I1_40 (str.len T_1c))) ; len 0
(assert (= I1_44 (str.len T_1c))) ; len 0
(assert (= 0 (str.len T1_40))) ; len 1
(assert (= I0_40 (str.len PCTEMP_LHS_11))) ; len 2
(assert (= T_1d (str.len T1_44))) ; len 3
(assert (= I0_44 (str.len PCTEMP_LHS_14))) ; len 4
(check-sat)
