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
