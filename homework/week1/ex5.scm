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
