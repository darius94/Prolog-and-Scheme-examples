#lang racket

;Darius Little
;10/14/2017


; 1.)Make Sequential List Function
(define make-seq-list
  (lambda (x y)
    (cond
      ((= x y) (list x))
      (else
       (cons x
         (make-seq-list (+ x 1) y))))))


; 2.)Make Whole List Function
(define make-whole-list
  (lambda (x)
    (make-seq-list 1 x)))


;3.)Find-ith-element Function
  (define find-ith-element
    (lambda (last currentPosition)
      (if (null? last)
          'False
          (if (= currentPosition 1)
          (car last)
          (find-ith-element (cdr last) (- currentPosition 1))))))


; 4.)Last-Element Function
(define last-element
  (lambda (l)
  (cond
    ((null? (cdr l)) (car l))
        (else
         (last-element (cdr l))))))


;5.)List-Length Function
(define list-length
  (lambda (lst)
  (if (empty? lst)
      0
      (+ 1 (list-length (rest lst))))))


; 6.)  Concat-list Function
(define concat-list
  (lambda (lst1 lst2)
  (cond
    ((null? lst1) lst2)    
    ((null? lst2) lst1)    
    (else
     (cons(car lst1) 
         (concat-list (cdr lst1) lst2)))))) 



; 7.) Reverse List Function
  (define (reverse-list lst)
  (define (reverse lst acc)
    (if (null? lst)
        acc
        (reverse
         (cdr lst)
         (cons (car lst) acc))))
    (reverse lst null))


; 8.)  Min Element and Max Element Function

(define min-element
  (lambda (lst)
    (cond
      ((null? (cdr lst)) (car lst))
          ((< (car lst)
          (min-element (cdr lst))) (car lst))
          (else
           (min-element (cdr lst))))))


(define max-element
  (lambda (lst)
  (cond
    ((null? lst))
    ((null? (cdr lst))
    (car lst))
    ((< (car lst) (cadr lst))
     (max-element (cdr lst)))
    (else 
     (max-element (cons (car lst) (cddr lst)))))))


; 9.)  Even Odd Function

(define even
  (lambda (lst)
      (if (null? lst)
          null
         (cons
          (car lst)
          (if (null? (cdr lst))
              null
              (even (cdr (cdr lst))))))))



(define odd 
  (lambda (lst)
      (if (null? lst)
          null
          (if (null? (cdr lst))
              null
              (cons
               (car (cdr lst))
               (odd (cdr (cdr lst))))))))

       

; 10.) Merge Function

 (define merge
    (lambda (lst1 lst2)
      (if (null? lst1)
          lst2
          (if (null? lst2)
              lst1
              (if (< (car lst1) (car lst2))
                  (cons (car lst1) (merge (cdr lst1) lst2))
                  (cons (car lst2) (merge (cdr lst2) lst1)))))))


; 11.) Merge Sort Function

   (define merge-sort
    (lambda (lst)
      (if (null? lst)
          lst
          (if (null? (cdr lst))
              lst
                (merge
                (merge-sort (odd lst))
                (merge-sort (even lst)))))))