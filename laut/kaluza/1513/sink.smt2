(set-logic QF_S)
(declare-fun T_73 () Bool)
(declare-fun T_74 () Bool)
(declare-fun T_SELECT_11 () Bool)
(declare-fun I0_173 () Int)
(declare-fun I0_177 () Int)
(declare-fun I1_173 () Int)
(declare-fun I1_177 () Int)
(declare-fun I2_173 () Int)
(declare-fun I2_177 () Int)
(declare-fun PCTEMP_LHS_45 () Int)
(declare-fun T_78 () Int)
(declare-fun NEW_DGNode_1096 () String)
(declare-fun NEW_DGNode_1097 () String)
(declare-fun PCTEMP_LHS_49 () String)
(assert (= PCTEMP_LHS_49 NEW_DGNode_1097))
(assert (= NEW_DGNode_1097 NEW_DGNode_1096))
(assert (not (str.in.re NEW_DGNode_1097 (str.to.re "+"))))
(assert (not (str.in.re NEW_DGNode_1096 (str.to.re "%"))))
(assert (= T_SELECT_11 (not (= PCTEMP_LHS_45 (- 1)))))
(assert T_74)
(assert (= T_74 (not T_73)))
(assert (= T_73 (= PCTEMP_LHS_45 (- 1))))
(assert (= I0_173 (- PCTEMP_LHS_45 0)))
(assert (>= PCTEMP_LHS_45 0))
(assert (= I2_173 I1_173))
(assert (<= PCTEMP_LHS_45 I1_173))
(assert (= T_78 (+ PCTEMP_LHS_45 1)))
(assert (>= T_78 0))
(assert (>= I2_177 T_78))
(assert (= I2_177 I1_177))
(assert (<= I2_177 I1_177))
(assert (= I0_177 (- I2_177 T_78)))
(assert (= I0_177 (str.len PCTEMP_LHS_49))) ; len 0
(check-sat)
