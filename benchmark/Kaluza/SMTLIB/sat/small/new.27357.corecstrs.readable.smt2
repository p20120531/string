(set-logic QF_S)

(declare-fun PCTEMP_LHS_1 () String)
(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun var_0xINPUT_43073 () String)
(declare-fun var_0xINPUT_86732 () String)

(assert (= T_1 (not (= "file:" var_0xINPUT_86732))))
(assert T_1)
(assert (= PCTEMP_LHS_1 var_0xINPUT_43073))
(assert (= T_2 (not (= PCTEMP_LHS_1 ""))))
(assert (= T_3 (not T_2)))
(assert T_3)

(check-sat)
