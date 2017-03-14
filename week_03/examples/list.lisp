('(11 22 33))
(list 11 22 33);конструируем список
(defvar lst '(11 22 33))
(first lst);#11
(rest lst);#(22 33)
(defvar lst2 '(44 55))
(defvar lst3 (append lst lst2)); #lst3->(11 22 33 44 55) добавляем в конец списка, неразрушающая
(setf lst '(11))
(push 22 lst); lst-> (22 11)
(setf lst (nreverse lst)); lst -> (11 22), разрушающая
(pushnew 33 lst); lst -> (33 11 22)
(cons 1 (cons 2 (cons 3 (cons 4 nil)))); =>  (1 2 3 4)

;; ASSOCIATED LISTS ! :;;;; ;;; ;; ; ;

(setf *alist* '((1 . "one") (2 . "two")))
(assoc 2 *alist*); => (2 . "two")
(assoc 3 *alist*); => NIL
(setf *list1* '("one" "two" "three"))
(setf *list2* '(1 2 3))
(setf *alist* (pairlis *list1* *list2*)); => (("three" . 3) ....

;;МНОЖЕСТВА

(setf *set* nil)
(setf *set* (adjoin "a" *set* :test #'string=)); => ("a")
(setf *set* (adjoin "b" *set* :test #'string=)); => ("b" "a")
(setf *set* (adjoin "a" *set* :test #'string=)); => ("b" "a")

(member "b" *set* :test #'string=) ; => ("b" "a")
(subsetp *set1* *set2*); T если все элементы первого множества есть и во втором
(intersection '(1 2 3) '(2 3 4)); => (2 3)
(union '(1 2 3) '(2 3 4)); => (1 2 3 4)
(set-difference '(1 2 3) '(2 3 4)); => (1)
(set-exclusive-or '(1 2 3) '(2 3 4)); => (1 4)

 ;*set1* (10 30 50 70) и *set2* (10 20 40 50 60)
(set-difference (union *set1* '(20 90)) *set2*); => (30 70 90)
