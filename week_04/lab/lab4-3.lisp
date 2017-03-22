(defvar *tree* '(1 (10 (15 nil nil) (7 nil nil)) (5 (2 nil nil) (8 nil nil))))

(defvar sum 0)
(defvar l 0)

(defun five-on-even (tree &optional l)
  (if (eq l nil) (setf l 0))
  (incf l)
  (if (and (eq (mod (car tree) 5) 0) (eq (mod l 2) 0))
    (setf sum (+ sum (car tree))))
  (if (nth 1 tree) (five-on-even (nth 1 tree) l))
  (if (nth 2 tree) (five-on-even (nth 2 tree) l))
  sum)

(print (five-on-even *tree*))
