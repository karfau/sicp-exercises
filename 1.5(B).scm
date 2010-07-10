
(define (sqrt x)
	(define (sqrt-iter guess)
		(if (good-enough guess)
				guess
				(sqrt-iter (improve guess))
		)
	)
	(define (improve guess)
		(avg guess (/ x guess))
	)
	(define (good-enough guess)
		(< (abs (- (* guess guess) x) ) 0.0001)
	)
	(sqrt-iter 1.0)
)

(define (abs x)
	(if (< x 0) (- x) x)
)

(define (avg x y)
	(/ (+ x y) 2)
)

(sqrt 3)