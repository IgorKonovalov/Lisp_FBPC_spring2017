
;; ввести 3-х мерный массив, и получить сумму его членов, являющихся целыми и неделящимися на 5 без остатка

; (defparameter arr (read))

(setf arr #3A(((1.8 5 #\B "may") ("the" 2.25 1.3 4) (17 0 "force" 55)) (("be" #C(0 1) 5.02 99) ("with" 1.1 (#\Y #\N) 0.87) ("you!" #C(2.2 3.3) 42 4.2))))

(defvar dimensions 0)
(defvar ii 0)
(defvar jj 0)
(defvar zz 0)
(defvar sum 0)

(setf dimensions (array-dimensions arr))

(setf ii (car dimensions))
(setf jj (cadr dimensions))
(setf zz (caddr dimensions))
(setf sum 0)

(dotimes (i ii)
  (dotimes (j jj)
    (dotimes (z zz)
      (when (and (integerp (aref arr i j z)) (not (= 0 (mod (aref arr i j z) 5))))
        (setf sum (+ sum (aref arr i j z)))))))

(print sum)
