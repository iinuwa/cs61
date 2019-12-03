(define (exercise1-2)
  (equal? (squares '(2 3 4 5))
	  (4 9 16 25)))

(define (squares s)
(if (empty? s)
    '()
     (se (square (first s)) (squares (bf s)))))

(define (square n) (* n n))

(exercise1-2)
