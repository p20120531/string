(set-logic QF_S)
(set-option :produce-models true)


(declare-fun url () String)
(declare-fun ret () String)
(declare-fun houseCityKeyName () String)


(assert (= url (str.++  "http://xf.house.somesite.com/"  houseCityKeyName  "/search/0-0-0-0-0-0-0-0-0-1-1.html") ) )

(assert (= ret url) )


(check-sat)
(get-model)