; f(x,y)=x(1+xy)2+y(1−y)+(1+xy)(1−y)
; a = 1 + xy
; b = 1 - y

(define (f x y)
  (define a (+ 1 (* x y)))
   (define b (- 1 y))
   (+ (* x (square a))
    (* y b)
     (* a b)))

; let 을 사용하여 정의하면 다음과 같다.
(define (f x y)
  (let ((a (+ 1 (* x y)))
    (b (- 1 y))
    (+ (* x (square a))
    (* y b)
     (* a b))))