(set-logic QF_S)

(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun var_0xINPUT_104815 () String)

(assert (= T_1 (= "LBf8SPC3SC" var_0xINPUT_104815)))
(assert (= T_2 (not T_1)))
(assert T_2)

(check-sat)
