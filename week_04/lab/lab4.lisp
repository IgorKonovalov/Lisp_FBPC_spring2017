; Прочитать из стандартного потока ввода список, содержащий целые числа, значения nil и другие списки. Рекурсивно заменить в прочитанном списке и вложенных в него списках все списки, содержащие только нечетные числа, суммой этих чисел. Вывести в стандартный поток вывода полученный результат.

; Дан список (1 3 5 (7 9 1) 11). Список (7 9 1) содержит только нечетные числа, а значит, должен быть заменен на их сумму. Получаем список (1 3 5 17 11), который также содержит только нечетные числа, поэтому он заменяется на 37. Этот ответ и выводится в стандартный поток вывода.

; Дан список (0 1 nil (1 3 (1 3) 5) 6). Список (1 3) содержит только нечетные числа, поэтому он должен быть заменен на их сумму. Получаем список (0 1 nil (1 3 4 5) 6). Здесь больше нечего заменять, этот результат и выводится в стандартный поток вывода.


(defparameter *temp* '(0 1 nil (1 3 (1 3) 5) 6))

;(defvar list (read))

(defun ifatom (lst)
  (cond
    ((null lst) t)
    ((not (atom (car lst))) nil)
    (t (ifatom (cdr lst)))))

(defun odd (lst)
  (cond
    ((null lst) t)
    ((not (eq (mod (car lst) 2) 1)) nil)
    (t (odd (cdr lst)))))

(defun sum (lst)
  (cond
    ((null lst) 0)
    (t (+ (car lst) (sum (cdr lst))))))

(defun ifinteger (lst)
  (cond
   ((null lst) t)
   ((not (integerp (car lst))) nil)
   (t (ifinteger (cdr lst)))))

(defun flatten-odd (lst)
  (if (ifatom lst)
    (if (and (ifinteger lst) (odd lst))
      (sum lst)
      (setf lst lst))
    ((if (listp (car lst)) (flatten-odd (car lst)))
     (if (listp (cdr lst)) (flatten-odd (cdr lst))))))





;(print (flatten-odd *temp*))

(print (flatten-odd '(1 3 (nil 5 5))))
