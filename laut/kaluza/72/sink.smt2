(set-logic QF_S)
(declare-fun T_32 () Bool)
(declare-fun T_33 () Bool)
(declare-fun T_SELECT_6 () Bool)
(declare-fun I0_78 () Int)
(declare-fun I0_82 () Int)
(declare-fun I1_78 () Int)
(declare-fun I1_82 () Int)
(declare-fun I2_78 () Int)
(declare-fun I2_82 () Int)
(declare-fun PCTEMP_LHS_20 () Int)
(declare-fun T_37 () Int)
(declare-fun NEW_DGNode_252 () String)
(declare-fun NEW_DGNode_253 () String)
(declare-fun NEW_DGNode_642 () String)
(declare-fun NEW_DGNode_643 () String)
(declare-fun NEW_DGNode_675 () String)
(declare-fun NEW_DGNode_676 () String)
(declare-fun PCTEMP_LHS_21 () String)
(declare-fun PCTEMP_LHS_24 () String)
(declare-fun T1_78 () String)
(declare-fun T1_82 () String)
(declare-fun T2_78 () String)
(declare-fun T2_82 () String)
(declare-fun T3_78 () String)
(declare-fun T3_82 () String)
(declare-fun T_36 () String)
(assert (= T_36 NEW_DGNode_643))
(assert (= NEW_DGNode_643 NEW_DGNode_642))
(assert (= NEW_DGNode_643 NEW_DGNode_252))
(assert (= NEW_DGNode_252 NEW_DGNode_253))
(assert (= NEW_DGNode_252 (str.++ T1_78 T2_78)))
(assert (= T2_78 (str.++ PCTEMP_LHS_21 T3_78)))
(assert (= NEW_DGNode_253 (str.++ T1_82 T2_82)))
(assert (= T2_82 (str.++ PCTEMP_LHS_24 T3_82)))
(assert (= PCTEMP_LHS_24 NEW_DGNode_676))
(assert (= NEW_DGNode_676 NEW_DGNode_675))
(assert (not (str.in.re NEW_DGNode_676 (str.to.re "+"))))
(assert (not (str.in.re NEW_DGNode_675 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_642 (str.to.re "&"))))
(assert (= T_SELECT_6 (not (= PCTEMP_LHS_20 (- 1)))))
(assert T_33)
(assert (= T_33 (not T_32)))
(assert (= T_32 (= PCTEMP_LHS_20 (- 1))))
(assert (= I0_78 (- PCTEMP_LHS_20 0)))
(assert (>= PCTEMP_LHS_20 0))
(assert (>= I2_82 T_37))
(assert (= I2_82 I1_82))
(assert (<= I2_82 I1_82))
(assert (= I0_82 (- I2_82 T_37)))
(assert (>= T_37 0))
(assert (= T_37 (+ PCTEMP_LHS_20 1)))
(assert (<= PCTEMP_LHS_20 I1_78))
(assert (= I2_78 I1_78))
(assert (= I1_78 (str.len T_36))) ; len 0
(assert (= I1_82 (str.len T_36))) ; len 0
(assert (= 0 (str.len T1_78))) ; len 1
(assert (= I0_78 (str.len PCTEMP_LHS_21))) ; len 2
(assert (= T_37 (str.len T1_82))) ; len 3
(assert (= I0_82 (str.len PCTEMP_LHS_24))) ; len 4
(check-sat)
