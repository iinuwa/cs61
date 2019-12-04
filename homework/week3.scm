; Homework 3.1-1.16
; SICP Exercise 1.16
; Design a procedure that evolves an iterative exponentiation process that
; uses successive squaring and uses a logarithmic number of steps, as does
; fast-expt. 
(define (fast-expt b n)
  (define (iter b n product)
  (cond ((= n 0) 1)
	 ((= n 1) (* b product))
	 ((odd? n) (fast-expt-iter b (- n 1) (* b product)))
	 ((even? n) (fast-expt-iter (* b b) (/ n 2) product))))
  (iter b n 1))

; Homework 3.1-1.35
; SICP Exercise 1.35
; Show that the golden ratio `f` is a fixed point of the transformation
; `x |-> 1 + 1 / x` , and use this fact to compute `f` by means of the
; `fixed-point` procedure. 

; Homework 3.1-1.37
; SICP Exercise 1.37

; Homework 3.1-1.38
; SICP Exercise 1.38

; Homework 3.2
; A "perfect number" is defined as a number equal to the sum of all its
; factors less than itself. For example, the first perfect number is 6,
; because its factors are 1, 2, 3, and 6,and 1+2+3=6. The second perfect
; number is 28, because 1+2+4+7+14=28. What is the third perfect number?
; Write a procedure `(next-perf n)` that tests numbers starting with `n` and
; continuing with `n+1`, `n+2`, etc. until a perfect number is found.  Then
; you can evaluate `(next-perf 29)` to solve the problem. Hint: you'll need a
; sum-of-factors subprocedure.
