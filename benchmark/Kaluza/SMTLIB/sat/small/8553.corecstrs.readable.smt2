(set-logic QF_S)

(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun var_0xINPUT_199925 () String)

(assert (= T_1 (= "MPTA39bMxh" var_0xINPUT_199925)))
(assert (= T_2 (not T_1)))
(assert T_2)

(check-sat)
