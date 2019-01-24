; '() 는 nil
(cons 1 
  (cons 2
    (cons 3
      (cons 4 '()))))
 
;  는 아래와 같다  
(list 1 2 3 4)


;리스트와 수 n을 인자로 받아서, 그 리스트의 n번째 원소를 리턴하는 list-ref
; n = 0 이면, list-ref의 값은 리스트의 car이다.
; 그렇지 않으면, list-ref는 리스트의 cdr에서 n-1번째 원소다.
(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))))

(define squares 
  (list 1 4 9 16 25))

(list-ref squares 3)

;list의 length를 알아내는 프로시져
(define (length items)
  (if (null? items)
  0
  (+ 1 (length (cdr items)))))

(define odds (list 1 3 5 7))

(length odds)

;list mapping
(define (scale-list items factor)
  (if (null? items)
    '()
    (cons (* (car items) factor)
      (scale-list (cdr items) factor))))

(scale-list (list 1 2 3 4 5) 10)

;map
(define (map proc items)
  (if (null? items)
    '()
    (cons (proc (car items))
      (map proc (cdr items)))))

(map abs (list -10 2.5 -11.6))

;map by hoc
(define (scale-list items factor)
  (map (lambda (x) (* x factor)) items))

(scale-list (list 1 2 3 4 5) 10)

