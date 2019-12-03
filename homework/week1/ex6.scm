; Exercise 6
; Most versions of Lisp provide `and` and `or` procedures like the
; ones on page 19. In principle there is no reason why these can't
; be ordinary procedures, but some versions ofLisp make them
; special forms. Suppose, for example, we evaluate
;`(or (= x 0) (= y 0) (= z 0))`
; If `or` is an ordinary procedure, all three argument expressions
; will be evaluated beforeoris invoked. But if the variable x has
; the value 0, we know that the entire expression hasto be true
; regardless of the values of`y` and `z`. A Lisp interpreter in
; which or is a special form can evaluate the arguments one by one
; until either a true one is found or it runs out of arguments.
; Your mission is to devise a test that will tell you whether
; Scheme'sandandorare specialforms or ordinary functions. This is
; a somewhat tricky problem, but it'll get you thinkingabout the
; evaluation process more deeply than you otherwisemight. 

(or (= 0 0) (= undefined-var 0))
(and (= 1 0) (= undefined-var 0))
; If these have short-circuiting special forms, these functions
; will execute without errors.
