;Задача
;найти заданный элемент с массиве (узнать индексы)

(defvar hyper (make-array '(5 5 5 5))) ;cоздаем четырехмерный массив 5-5-5-5

(setf (aref hyper (random 5) (random 5) (random 5) (random 5)) 42) ;кладем в случайную ячейку 42 aref - достает случайную ячейку

(block outer
  (dotimes (i 5)
    (dotimes (j 5)
      (dotimes (k 5)
        (dotimes (s 5)
          (when (= 42 (aref hyper i j k s))
            (return-from outer
              (list i j k s))))))))

(defvar a (make-array '(3 3))) ;создаем массив
(aref a 1 1) ;доступ к элементу в ячейке [1][1]
(setf a (make-array 3 :initial-element 42)) ; #(42 42 42)
(setf a (make-array 5 :initial-contents '(1 2 3 4 5))) ;#(1 2 3 4 5)
(setf a (vector 11 22 33 44 55));#(11 22 33 44 55)
(setf a (adjust-array a 6));#(11 22 33 44 55 0)
(array-total-size a);#5
(setf arr (make-array 3 :fill-pointer 0)); устанавливаем каретку на 0
(vector-push 42 arr); вставляем на место каретки 42, каретка на 1
(vector-pop arr);#42 - выбираем сверху стека, каретка на 0
(fill-pointer arr); - место каретки
(vector-push-extend 42 arr 3);если места для вставки не осталось, увеличиваем массив на 3 ячейки и вставляем в одну из них 
