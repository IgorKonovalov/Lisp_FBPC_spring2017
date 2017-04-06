(defparameter *fn* #'+)

(setf a (funcall *fn* 1 2 3 4))

(print a)

(defun f (x) (- (* x x) 1))

(defun g (x) (+ (* x x) 1))

(defun func-coords (fn from to step);ф высшего порядка
  (do ((x from (+ x step)) res)
    ((> x to) (nreverse res))
    (push (list x (funcall fn x)) res)))

(print (func-coords #'f -2.0 2.0 1.0))
