(set-logic QF_S)

(declare-fun T_1 () Bool)
(declare-fun var_0xINPUT_125411 () String)

(assert (= T_1 (not (= "j2DpYJpVEE" var_0xINPUT_125411))))
(assert T_1)

(check-sat)
