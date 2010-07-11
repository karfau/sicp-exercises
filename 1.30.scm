#lang r5rs
(define (sum-rec term a next b)
;  (display "a=")(display a)(display ", adding=")(display (term a))(display ", next=")(display (next a))
;  (newline)
  (if (> a b) 0
      (+ (term a) 
         (sum-rec term (next a) next b)
)))

(define (++ n) (+ n 1))
(define (identity x) x)
(define (test) 
  ;S(sum-rec identity 0 ++ 10)
  (sum identity 0 ++ 10)
 )
         
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result)))
  ) 
  (iter a 0)
)