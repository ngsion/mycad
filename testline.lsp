(defun testline()
   (setq a (getpoint "\n选择第一点"));
    (setq b (getpoint "\n选择第二点"));
    (command "Line" a b "");
)

(setq p2 (getvar "asmode")); 获取当前捕捉设置
     (setvar "asmode" 0)
     (setvar "asmode" p2)

(alert "finish")
(setvar "cmdecho" 0)

(max 15 10)
(+ 1 2 3 4)

(defun Add(#iNum1$  #iNum2$ / #iNumSum)
  (setq  #iNumSum (+ #iNum1$  #iNum2$)) ;;#$没有实际意义
)

(defun  C:Multiplication( / #iNum1 #iNum2 #iNumMul)
    (setq  #iNum1 (GetInt "\n input one integer:"))
    (setq #iNum2 (GetInt "\n input another integer:"))
    (setq #iNumMul (* #iNum1 #iNum2))
)


(defun C:Drawline(/ #iCmdEcho #ptStart #ptEnd)
  (setq #iCmdEcho (getvar "CMDECHO"))
  (setvar "CMDECHO" 0)
  (setq #ptStart (getpoint "\n pls point the start:"))
  (setq #ptEnd (getpoint "\n pls point the end:"))
  (command "line" #ptStart #ptEnd "")
  (setvar "CMDECHO" #iCmdEcho)
  (princ)
)


(setq  #lsList (list 1 2 3))
(cdr #lsList)
(car #lsList)
(setq #lsList '(3 2))
(append #lsList '(1))


(entget(car(entsel))) ;;列出所选图元的所有属性信息
(entget(car(entsel)) '("*")) ;;列出所选图元的所有属性信息(包括扩展数据)

;; 我们要创建一条直线，首先声明直线这个类型，然后就是直线的必要元素，起点和终点
(entmake  (list (cons 0 "LINE")  (CONS 10 (list 0 0 0))  (cons 11 (list 100 0 0)) ) )

(entmake (list (cons)))

(command "erase" (car(entsel)) "")
(entdel(car(entsel)))


(setq #file (open "D:/info.txt"  "r"))
(setq #strContext (read-line #file))
(setq #strContext (read-char #file))
(write-line "write file test" #file)
(write-char 67 #file)
(close #file)


(defun C:DrawCircle (/ #ptCenter #dRadius)
   (setq #ptCenter (getpoint "\nthe center:")
         #dRadius (getreal "\nthe radius:")    )
  
   (if (> #dRadius 0)
      (progn
         (command "circle" #ptCenter #dRadius "")
         (princ "good")
      )
     (progn
        (alert "invalid raidus")
        (princ "failed")
     )
   ) ;if
  
)
