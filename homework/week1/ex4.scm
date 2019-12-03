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
