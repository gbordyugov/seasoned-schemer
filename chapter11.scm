(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a) (member? a (cdr lat)))))))

(member? 'a '(c b a))

(define is-first?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (eq? a (car lat))))))

(is-first? 'a '(a b c))

(is-first? 'a '(b b c))


(define two-in-a-row?
  (lambda (lat)
    (cond
      ((null? lat) #f)
      (else (or (is-first? (car lat) (cdr lat))
            (two-in-a-row? (cdr lat)))))))

(two-in-a-row? '(a b b c))
(two-in-a-row? '(a a b c))
(two-in-a-row? '(a x b c))
                          
(define two-in-a-row?
  (lambda (lat)
    (cond
      ((null? lat) #f)
      (else (is-first-b? (car lat) (cdr lat))))))

;; observation: there is no explicit recursion in the new version of
;; two-in-a-row? it apparently should happen in is-first-b?

;; I have no idea how to do that....
(define is-first-b?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? a (car lat)) (two-in-a-row? lat))))))

(two-in-a-row? '(a b b c))
(two-in-a-row? '(a b x c))
(two-in-a-row? '(a a x c))
(two-in-a-row? '(a a c c))
(two-in-a-row? '(a b c d))

(define two-in-a-row-b?
  (lambda (preceeding lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? preceeding (car lat))
                (two-in-a-row-b? (car lat) (cdr lat)))))))

(two-in-a-row-b? 'a '(a b b c))
(two-in-a-row-b? 'a '(a b x c))
(two-in-a-row-b? 'a '(a a x c))
(two-in-a-row-b? 'a '(a a c c))
(two-in-a-row-b? 'a '(a b c d))

(define two-in-a-row?
  (lambda (lat)
    (cond
      ((null? lat) #f)
      (else (two-in-a-row-b? (car lat) (cdr lat))))))
