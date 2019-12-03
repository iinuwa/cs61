(define (inc a) (+ a 1))
(define (identity a) a)
(define (square x) (* x x))

; Homework 2.1a
; SICP Exercise 1.31a
; The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures. Write an
; analogous procedure called product that returns the product of the values of
; a function at points over a given range.

(define (exercises2-1a-1)
  (define (double a) (* a 2))
  (equal? (product double inc 1 3) 48))

(define (product term next a b)
  (if (> a b)
      1
      (* (term a) 
	 (product term next (next a) b))))
'exercise2-1a-1
(exercises2-1a-1)

; Homework 2.1b
; SICP Exercise 1.31b
;  Show how to define factorial in terms of product.
(define (exercises2-1a-2)
  (equal? (factorial 5) 120))
(define exercises2-1a-3-expected (/ (* 2 4 4 6 6 8) (* 3 3 5 5 7 7)))

(define (factorial b)
  (product identity inc 1 b))

'exercise2-1a-2
(exercises2-1a-2)

; Homework 2.1c
; SICP Exercise 1.31c
; Use `product` to compute approximations to π using the formula (by John
; Wallis).
(define (exercises2-1a-3)
  (equal? (pi-approx 6) exercises2-1a-3-expected))
(define (pi-approx b)
  (/ (product (lambda (x) (+ 2 (* 2 (floor (/ x 2))))) inc 1 b)
     (product (lambda (x) (+ 3 (* 2 (floor (/ (- x 1) 2))))) inc 1 b)))

'exercises2-1a-3
(exercises2-1a-3)

; Homework 2.1
; SICP Exercise 1.32
; Show that sum and product  are both special cases of a still more general
; notion called accumulate that combines a collection of terms, using some
; general accumulation function...

(define (exercises2-1b)
  (define (sum-accum term next a b)
    (accumulate + 0 term next a b))
  (define (product-accum term next a b)
    (accumulate * 1 term next a b))
  (and (equal? (sum-accum identity inc 1 3) 6)
       (equal? (product-accum identity inc 1 4) 24)))

(define (accumulate
	  combiner null-value term next a b)
  (if ( > a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term next (next a) b))))

'exercises2-1b
(exercises2-1b)

; Homework 2.1d
; SICP Exercise 1.40
; Define a procedure cubic that can be used together with the newtons-method
; procedure in expressions of the form `(newtons-method (cubic a b c) 1)` to
; approximate zeros of the cubic `x^3 + a x 2 + b x + c` . 

; Homework 2.1e
; SICP Exercise 1.41
; Define a procedure `double` that takes a procedure of one argument as argument
; and returns a procedure that applies the original procedure twice. For
; example, if `inc` is a procedure that adds 1 to its argument, then
; `(double inc)` should be a procedure that adds 2. What value is returned by
; `(((double (double double)) inc) 5)`
(define (exercises2-1e)
  (define double-inc (double inc))
  (and (equal? (double-inc 3) 5)
       (equal? (((double (double double)) inc) 5) 21)))

(define (double fn)
  (lambda (x) (fn (fn x))))

(exercises2-1e)

; Homework 2.1f
; SICP Exercise 1.43
;  If `f` is a numerical function and n is a positive integer, then we can form
;  the `n`th repeated application of `f`, which is defined to be the function
;  whose value at `x` is `f ( f ( … ( f ( x ) ) … ) )` . For example, if `f` is the
;  function `x ↦ x + 1`, then the `n`th repeated application of `f` is the function
;  `x ↦ x + n`. If `f` is the operation of squaring a number, then the n th
;  repeated application of f is the function that raises its argument to the 2
;  n -th power. Write a procedure that takes as inputs a procedure that
;  computes f and a positive integer n and returns the procedure that computes
;  the n th repeated application of f . Your procedure should be able to be
;  used as follows:
; ((repeated square 2) 5)
; 625

(define (exercise2.1f)
  (equal? ((repeated square 2) 5) 625))

(define (repeated fn n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (accumulate compose identity (lambda (_) fn) inc 1 n))

(exercise2.1f)
; Homework 2.1g
; SICP Exercise 1.46
; Several of the numerical methods described in this chapter are instances of
; an extremely general computational strategy known as iterative improvement.
; Iterative improvement says that, to compute something, we start with an
; initial guess for the answer, test if the guess is good enough, and otherwise
; improve the guess and continue the process using the improved guess as the
; new guess. Write a procedure iterative-improve that takes two procedures as
; arguments: a method for telling whether a guess is good enough and a method
; for improving a guess. Iterative-improve should return as its value a
; procedure that takes a guess as argument and keeps improving the guess until
; it is good enough. Rewrite the sqrt procedure of 1.1.7 and the fixed-point
; procedure of 1.3.3 in terms of iterative-improve.

; Homework 2.2
; ...[C]reate a higher-order procedure called `every` that applies an
; arbitrary procedure, given as an argument, to each word of an argument
; sentence.
(define (exercise2.2)
  (and (equal? (every square '(1 2 3 4)) '(1 4 9 16))
       (equal? (every first '(nowhere man)) '(n m))))

(define (every fn s)
  (if (empty? s) '()
      (se (fn (first s)) (every fn (bf s)))))

(exercise2.2)
