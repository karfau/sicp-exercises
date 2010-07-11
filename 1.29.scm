#lang r5rs
(define (cube x) (* x x x))
(define (++ n) (+ n 1))
(define (sum term a next b)
;  (display "a=")(display a)(display ", adding=")(display (term a))(display ", next=")(display (next a))
;  (newline)
  (if (> a b) 0
      (+ (term a) 
         (sum term (next a) next b)
)))
(define (even? x) (= (remainder x 2.0) 0))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
;> (integral cube 0 1 0.0001)
;0.0001   -> 0.24999999874993412
;0.00001  -> 0.24999999998662864
;0.000001 -> 0.2500000000014447 (needs 256 MB RAM)


(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h)) ))
  (define (y-to-add k) 
    (* (if (even? k) 2 4) (y k)))
   
  (if (not (even? n)) (integral-simpson f a b (++ n))
      (* (/ h 3.0)
         (+ (y a) (y n)
            (sum y-to-add (+ a 1) ++ (- n 1)))))
)
;(integral-simpson cube 0 1 n)
;n=100 or 1000 (or 2) -> 0.25
;n=100.0  -> 0.24999999999999992
;n=1000.0 -> 0.2500000000000003