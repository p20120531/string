(set-logic QF_S)
(declare-fun s () String)
(declare-fun ret () String)
(assert (not (str.contains s "<") ) )
(assert (not (str.contains s ">") ) )
(assert (= ret s) )
(assert (str.contains s "sc") )
(assert (str.contains s "ript scr=") )
(assert (not (= ret "x") ) )
(check-sat)
