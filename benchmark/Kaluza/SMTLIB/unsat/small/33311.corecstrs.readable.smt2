(set-logic QF_S)

(declare-fun T_1 () Bool)
(declare-fun var_0xINPUT_100021 () String)

(assert (= T_1 (not (= "" var_0xINPUT_100021))))
(assert T_1)

(check-sat)
