(set-logic QF_S)

(declare-fun PCTEMP_LHS_1 () String)
(declare-fun var_0xINPUT_10596 () String)

(assert (= PCTEMP_LHS_1 var_0xINPUT_10596))
(assert (not (str.in.re PCTEMP_LHS_1 (str.to.re "%"))))

(check-sat)
