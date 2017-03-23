(defun ifatom (lst)
 (cond
  ((null lst) t)
  ((not (atom (car lst))) nil)
  (t (ifatom (cdr lst)))))

(defparameter *list* '(1 nil 2 3 nil "foo"))

(print (ifatom *list*))



(defparameter *odd* '(1 3 5))

(defun odd (lst)
 (cond
   ((null lst) t)
   ((not (eq (mod (car lst) 2) 1)) nil)
   (t (odd (cdr lst)))))

(print (odd *odd*))

(defun sum (lst)
  (cond
   ((null lst) 0)
   (t (+ (car lst) (sum (cdr lst))))))

(print (sum *odd*))

(defun not-integer (lst)
  (cond
   ((null lst) t)
   ((not (integerp (car lst))) nil)
   (t (not-integer (cdr lst)))))

(print (not-integer *odd*))

; пример для (labels (задаем функции) (используем функции))
(defun recursive-times (k n)
   (labels ((temp (n)
              (if (zerop n) 0 (+ k (temp (1- n))))))
     (temp n)))
