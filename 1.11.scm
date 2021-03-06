#lang R5RS

(define (f-rec x)
  (if (< x 3) x
      (+ (f-rec (- x 1))
	 (* 2 (f-rec (- x 2)))
	 (* 3 (f-rec (- x 3))))
  )
)

(define (f-it x)
  ;f-iter returnes x if x<3 and sum when current
  (define (f-iter sum add2 add3 current)
    (cond ((< x 3) x)
	  ((< current x); && x>2
	   ;x>2#1 #in=2,1,0;2  
	   ;x>3#2 #in=4,2,1;3
	   ;x>4#3 #in=11,4,2;4
	   ;x>5#4 #in=25,11,4;5
	   ;...
	   (f-iter (+ sum (* 2 add2) (* 3 add3))
		   (if (< sum 3) current sum) 
		   (if (< add2 3) (- current 1) add2)
		   (+ current 1))
	  )
	  ;current==x && x>=3
	  (else sum)
  ))
  ;2 is the last number where no addition has to be done
  (f-iter 2 1 0 2)
)

(define n 25)
(f-rec n)
(f-it  n)


