(set-logic QF_S)
(set-option :produce-models true)

(declare-fun s () String)
(declare-fun ret () String)


(assert (not (str.contains s "<") ) )
(assert (not (str.contains s ">") ) )
(assert (= ret s) )
(assert (str.contains s "sc") )
(assert (str.contains s "ript scr=") )
(assert (not (= ret "x") ) )


(check-sat)
(get-model)