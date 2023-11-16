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

        