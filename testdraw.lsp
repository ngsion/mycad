(defun c:pbox()
 
 
 (setq a (list 0.0 0.0))
    (setq w 9.0)
    (setq h 9.0)
    ;b, c, d矩形的另外四个点的坐标值，由a,w,h计算得出
    (setq b (polar a 0 w))
    (setq c (polar b (/ pi 2) h))
    (setq d (polar c pi w))
    ;根据a，b，c，d四个点绘制矩形
    (command "pline" a b c d "c")
  

  ;(command "point" a)
 ;(setq pt (list 10.0 5.0)) ; 定义坐标点 (10, 5)
;(setq ent (entmake (list '(0 . "POINT") (cons 10 pt)))) ; 创建点实体
;(command "_.zoom" "_extents" "") ; 调整视图以查看点
  (princ)
)


(defun c:read-file ()
  (setq file (open "F:\\mycad\\mycad\\result_128X128_start_7_3_250.txt" "r")) ; 打开文件
  (if file
      (progn
        (setq xpos 0)
        (setq ypos 129)
        (setq char (read-char file)) ; 逐个读取字符
        (while (not (null char))
          (if (equal char 32) ; 判断字符是否为空格（ASCII码为32）
              (progn 
                 (princ "  ")
              );progn
              (progn
                  (if (equal char 10)
                    (progn
                         (princ "换行 ")
                     (princ ypos)
                      (princ "ypos:")
                        (terpri)
                        (setq ypos (- ypos 1))
                        (setq xpos 0)
                     )
                     (progn
                      
                        (if (equal char 49)
                          (progn
                            (princ (strcat (chr char) " "))
                            (setq pt (list xpos ypos)) ; 定义坐标点 (10, 5)
                            (setq ent (entmake (list '(0 . "POINT") (cons 10 pt)))) ; 创建点实体
                           
                          )
                        )
                         (setq xpos (+ xpos 1))
                       
                     )
                  )
               )
             ) ; 输出字符
          (setq char (read-char file))) ; 继续读取下一个字符
        (close file) 
        princ 
         (command "_.zoom" "_extents" "") ; 调整视图以查看点
      
      )
      (princ "无法打开文件")))

