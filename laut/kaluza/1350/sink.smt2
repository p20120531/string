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
(declare-fun NEW_DGNode_1508 () String)
(declare-fun NEW_DGNode_1509 () String)
(declare-fun NEW_DGNode_1655 () String)
(declare-fun NEW_DGNode_1656 () String)
(declare-fun NEW_DGNode_1718 () String)
(declare-fun NEW_DGNode_1719 () String)
(declare-fun NEW_DGNode_1781 () String)
(declare-fun NEW_DGNode_1782 () String)
(declare-fun NEW_DGNode_1844 () String)
(declare-fun NEW_DGNode_1845 () String)
(declare-fun NEW_DGNode_1907 () String)
(declare-fun NEW_DGNode_1908 () String)
(declare-fun NEW_DGNode_1970 () String)
(declare-fun NEW_DGNode_1971 () String)
(declare-fun PCTEMP_LHS_177 () String)
(assert (= PCTEMP_LHS_177 NEW_DGNode_1971))
(assert (= NEW_DGNode_1971 NEW_DGNode_1970))
(assert (= NEW_DGNode_1971 NEW_DGNode_1908))
(assert (= NEW_DGNode_1908 NEW_DGNode_1907))
(assert (= NEW_DGNode_1908 NEW_DGNode_1845))
(assert (= NEW_DGNode_1845 NEW_DGNode_1844))
(assert (= NEW_DGNode_1845 NEW_DGNode_1782))
(assert (= NEW_DGNode_1782 NEW_DGNode_1781))
(assert (= NEW_DGNode_1782 NEW_DGNode_1719))
(assert (= NEW_DGNode_1719 NEW_DGNode_1718))
(assert (= NEW_DGNode_1719 NEW_DGNode_1656))
(assert (= NEW_DGNode_1656 NEW_DGNode_1655))
(assert (= NEW_DGNode_1656 NEW_DGNode_1509))
(assert (= NEW_DGNode_1509 NEW_DGNode_1508))
(assert (not (str.in.re NEW_DGNode_1509 (str.to.re "+"))))
(assert (not (str.in.re NEW_DGNode_1508 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_1655 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_1718 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_1781 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_1844 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_1907 (str.to.re "%"))))
(assert (not (str.in.re NEW_DGNode_1970 (str.to.re "%"))))
(assert (= T_SELECT_4 (not (= PCTEMP_LHS_10 (- 1)))))
(assert T_19)
(assert (= T_19 (not T_18)))
(assert (= T_18 (= PCTEMP_LHS_10 (- 1))))
(assert (= I0_40 (- PCTEMP_LHS_10 0)))
(assert (>= PCTEMP_LHS_10 0))
(assert (= I2_40 I1_40))
(assert (<= PCTEMP_LHS_10 I1_40))
(assert (= T_1d (+ PCTEMP_LHS_10 1)))
(assert (>= T_1d 0))
(assert (>= I2_44 T_1d))
(assert (= I2_44 I1_44))
(assert (<= I2_44 I1_44))
(assert (= I0_44 (- I2_44 T_1d)))
(assert (= I0_44 (str.len PCTEMP_LHS_177))) ; len 0
(check-sat)
