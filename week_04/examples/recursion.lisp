(defun fib (n)
  "n-й член ряда Фибонначи"
  (if (< n 2)
   1
   (+ (fib (- n 1)) (fib (- n 2)))))

;теперь с сохранением промежуточных значений

(defparameter *fibarr* (make-array 100 :initial-element nil))
(setf (aref *fibarr* 0) 1 (aref *fibarr* 1) 1)

(defun fib-memo (n)
  "n-ный член ряда Фибоначчи"
  (if (null (aref *fibarr* n))
      (setf (aref *fibarr* n)
          (+ (fib-memo (- n 1)) (fib-memo (- n 2))))
   (aref *fibarr* n)))

;хвостовая рекурсия

(defun fib-tail (n &optional (prev 1) (next 1))
  "n-й член ряда Фибоначчи"
  (if (< n 2)
    next
    (fib-tail (- n 1) next (+ prev next))))
