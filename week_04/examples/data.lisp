;разбить исходный список на списки по n элементов в каждом

(defun split-by-1 (lst n) ;неверное решение - вылетает если не делится нацело или n = 0
  (if (not (eq lst '()))
   (cons (subseq lst 0 n) (split-by-1 (nthcdr n lst) n))
   '()))

(defun split-by (lst n) ;верное решение
  (labels
    ((take (lst n) ;обозначаем локальную функцию take - как subseq но может брать и часть листа меньше чем на указанный номер, если лист короче
      (if (or (= n 0) (null lst))
       '() ;если да, вернет пустой лист
       (cons (car lst) ;если нет, вызывает рекурсивно себя прибавляя к началу листа хвост по одному элементу
        (take (cdr lst) (- n 1))))))
    (cond ;сложное условие - аналог switch
      ((<= n 0) lst) ;вернем лист если n 0
      ((null lst) '()) ;пустой лист если лист пуст
      (t (cons (take lst n) ;условие по умолчанию - см функцию выше, тоже самое
          (split-by (nthcdr n lst) n))))))

;(print (split-by '(1 2 3 4 5 6 7) 3))

(defun flatten (lst) ;сглаживаем список
 (append '()
  (if (atom (car lst))
    (if (car lst) (list (car lst))) ;если да
    (flatten (car lst))) ;если нет
  (if lst (flatten (cdr lst)))))

;(print (flatten '(() 1 (2 (3 ((4)) 5) (6)) (()) 7)))

(defparameter *tree* '(42 (33 (10) (36)) (99)))

(defun bst-preorder (tr)
  (if tr
    (format t "~a " (car tr)))
  (if (nth 1 tr) (bst-preorder (nth 1 tr)))
  (if (nth 2 tr) (bst-preorder (nth 2 tr))))

(bst-preorder *tree*)
