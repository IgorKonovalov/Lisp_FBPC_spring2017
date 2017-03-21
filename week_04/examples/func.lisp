(defun func (a1 a2 &optional o1 o2) ;необязательные аргументы
  (list a1 a2 o1 o2))

(defun func (&optional (o1 42 o1-p))) ;значение по умолчанию и дополнительный проверочный аргумент?

(defun func (a1 a2 &rest r)
  list(a1 a2 r)) ;r содержит все дополнительные агрументы

(defun my-plus (&rest r) ;функция складывает любое количество чисел
  (let ((res 0))
    (dolist (arg r)
      (incf res arg))
  res))

(defun func (&key (k1 0) (k2 11)) ;ключевые аргументы
  (list k1 k2))

;lambda-list-keywords
(&OPTIONAL &REST &KEY &ALLOW-OTHER-KEYS)

;нежелетельно комбинировать необязательные и ключевые элементы
