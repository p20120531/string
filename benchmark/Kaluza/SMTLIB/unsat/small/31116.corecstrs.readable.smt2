(set-logic QF_S)

(declare-fun T_1 () Int)
(declare-fun T_2 () Bool)
(declare-fun var_0xINPUT_215394 () String)

(assert (= T_1 (str.len var_0xINPUT_215394)))
(assert (= T_2 (< 0 T_1)))
(assert T_2)

(check-sat)
