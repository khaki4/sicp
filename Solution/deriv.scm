(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product 
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product 
           (deriv (multiplier exp) var)
           (multiplicand exp))))
        (else (error "unknown expression 
                      type: DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))

; 덧셈식은 첫번째 원소가 + 이다
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

; 더하임수는 덧셈 리스트의 두번째 원소이다
(define (addend s) (cadr s))

; 덧수는 덧셈 리스트의 두번째 원소이다
(define (augend s) (caddr s))

;곱셈 식은 첫번째 원소가 * 기로호 시작되는 리스트이다
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
; (product? (list '* 1 2))

;곱하임 수는 곰섹 리스트의 두번째 원소이다
(define (multiplier p) (cadr p))

;곱수는 곱셈 식 리스트에서 세번째 원소이다
(define (multiplicand p) (caddr p))


; result
(deriv '(+ x y) 'x)