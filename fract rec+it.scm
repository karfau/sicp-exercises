
(define (-- x) (- x 1))
(define (++ x) (+ x 1))

(define (fract-rec x)
  (if (= x 1) 1
      (* x (fract-rec (-- x)))
))
;Value: fract-rec


(fract-rec 4)
;Value: 24




