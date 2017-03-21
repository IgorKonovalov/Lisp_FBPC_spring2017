(dotimes (i 10) (if (> i 5) (return)) (print i))

(defun func (&rest xs &aux (s 0))
  (dolist (x xs)
      (multiple-value-bind (i f) (truncate x)
          (setf s (+ s f))))
  s)
