(set-logic QF_S)

(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun var_0xINPUT_38869 () String)

(assert (= T_1 (not (= "6JX7G3VKFq" var_0xINPUT_38869))))
(assert T_1)
(assert (= T_2 (not (= var_0xINPUT_38869 ""))))
(assert T_2)

(check-sat)
