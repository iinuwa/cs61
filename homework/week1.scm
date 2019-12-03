(define (exercise1-2)
  (equal? (squares '(2 3 4 5))
	  (4 9 16 25)))

(define (squares s)
(if (empty? s)
    '()
     (se (square (first s)) (squares (bf s)))))

(define (square n) (* n n))

(exercise1-2)

; CS61 Exercise 1.3

(define (exercise1-3)
  (equal? (switch '(You told me that I should wake you up))
	  (i told you that you should wake me up)))
(define (switch s)
(cond ((empty? s) '())
      ((equal? (first s) 'You) (se 'I (switch-iter (bf s))))
      (else (switch-iter s))))

(define (switch-iter s)
(if (empty? s) '()
(se
  (cond ((member? (first s) '(I me)) 'you)
        ((equal? (first s)  'you)    'me)
        (else (first s)))
  (switch-iter (bf s)))))

(exercise1-3)

; CS61 Exercise 1.4
(define (exercise1-4)
  (and (ordered '(1 2 3))
       (not (ordered '(1 3 2)))
       (ordered '())
       (ordered '(1))))

(define (ordered i)
(or
  (empty? i)
  (empty? (bf i))
  (and (<= (first i) (first (bf i)))
       (ordered (bf i)))))
(exercise1-4)

; CS61 Exercise 1.5
(define (exercise1-5)
  (equal? (ends-e '(please put the salami above the blue elephant))
	  '(please the above the blue)))
(define (ends-e s)
  (define (filter w)
    (if (equal? 'e (last w)) w '()))

  (if (empty? s)
      '()
      (se (filter (first s)) (ends-e (bf s)))))

(exercise1-5)
; CS61 Exercise 1.6
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
