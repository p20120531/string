(set-logic QF_S)
(declare-fun v1 () String)
(declare-fun ret () String)
(assert (not (str.contains v1 "<") ) )
(assert (= ret v1) )
(assert (str.contains ret ">") )
(check-sat)
