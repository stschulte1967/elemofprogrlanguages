#lang eopl

;;; in-S? : N -> Bool
;;; usage (in-S? n) = #t if n is in S, #f otherwise
(define in-S?
  (lambda (n)
    (if (zero? n) #t
        (if (>= (- n 3) 0)
            (in-S? (- n 3))
            #f))))

;;; list-length : List -> Int
;;; usage: (list-length l) = the length of l
;;; example: (list-length '(a b c d))
(define list-length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (list-length (cdr lst))))))

;;; nth-element : List x Int -> SchemeVal
;;; usage: (nth-element lst n) = the nth element of lst
;;; examples:
;;;    (nth-element '(a b c d) 1)
;;;    (nth-element '(a b c d) 5)

(define nth-element
  (lambda (lst n)
    (if (null? lst)
        (report-lst-too-short n)
        (if (zero? n)
            (car lst)
            (nth-element (cdr lst) (- n 1))))))

(define report-lst-too-short
  (lambda (n)
    (eopl:error 'nth-element
                "List too short by ~s elements.~%" (+ n 1))))

;;; remove_first : Sym x Listof(Sym) -> Listof(Sym)
;;; usage: (remove-first s los) returns a list woth the same
;;;        elements arranged in the same order as los except
;;;        that the first occurence of the symbol s is removed.
;;; examples:
;;;        (remove-first 'a '(a b c))
;;;        (remove-first 'b '(e f g))
;;;        (remove-first 'a4 '(c1 a4 c1 a4))
;;;        (remove-first 'x '())
(define remove-first
  (lambda (s los)
    (if (null? los)
        '()
        (if (eqv? s (car los))
            (cdr los)
            (cons (car los) (remove-first s (cdr los)))))))
;;; remove : Sym x Listof(Sym) -> Listof(Sym)
;;; usage: (remove-first s los) returns a list with the same
;;;        elements arranged in the same order as los except
;;;        that the all occurences of the symbol s are removed.
;;; examples:
;;;        (remove 'a '(a b c))
;;;        (remove 'b '(e f g))
;;;        (remove 'a4 '(c1 a4 c1 a4))
;;;        (remove 'x '())
(define remove
  (lambda (s los)
    (if (null? los)
        '()
        (if (eqv? s (car los))
            (remove s (cdr los))
            (cons (car los) (remove s (cdr los)))))))
   
        