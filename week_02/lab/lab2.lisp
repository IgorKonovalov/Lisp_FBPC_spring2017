;Прочитать беззнаковое целое число из стандартного потока ввода и в каждом байте числа обнулить нулевой и седьмой биты и сделать единичными третий и четвертый биты. Результат вывести в стандартный поток вывода.

(defun change-byte (b)
  (setf b
    (dpb 0 (byte 1 0) b))
  (setf b
    (dpb 0 (byte 1 7) b))
  (setf b
    (dpb 1 (byte 1 3) b))
  (setf b
    (dpb 1 (byte 1 4) b)))

(defvar x 0)

(setf x (read))

(dotimes (i (ceiling (integer-length x) 8))
  (setf x
    (dpb
      (change-byte (ldb (byte 8 (* i 8)) x))
      (byte 8 (* i 8)) x)))

(print x)
