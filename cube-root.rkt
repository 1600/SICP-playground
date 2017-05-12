#lang sicp
(define (pow base index)    ;only positive int
  ( if (= index 1) base ( * base (pow base (- index 1)))))

(define (square x)(pow x 2))

(define (cube x) (pow x 3))

(define (goodenough? guess target)
  (< (abs (- (cube guess) target)) 0.000000000000000000001))

(define (improve_guess guess target)
  (/ (+ (/ target (pow guess 2))(* 2 guess) ) 3))


(define (FindCubeRoot num target)
  (define new_guess (improve_guess num target))
  (if (goodenough? new_guess target)
      num
      (FindCubeRoot new_guess target)
   )
 )

(define (cube-root x)(FindCubeRoot x x))

;TESTS
;(goodenough? 10 1000)
;(pow 2 3)
;(FindCubeRoot 8 8)
(cube-root 8)