 (defun c:plot ()
  (setq insunits 4) ; 设置坐标单位为毫米
  
  (setq current-precision (getvar "luprec"))
  (setq new-precision 4)  ; 设置新的线性单位精度（小数点后4位）
  (setvar "luprec" new-precision)
  (setq scaling-factor (/ 0.184 1.0))  ; 计算新的单位缩放因子, cross 间距0.184mm，在这里是1，
  (setvar "dimlfac" scaling-factor)
  (setq annotative-scale (/ 0.184 1.0))
  (setvar "dimscale" annotative-scale)
  (princ "Custom units set successfully.")
  
  
  (setq width 648)
  (setq height 480)
  
  ;绘制矩形
   (setq a (list -1 -1))
    (setq w (+ width 3))
    (setq h (+ height 3))
    ;b, c, d矩形的另外四个点的坐标值，由a,w,h计算得出
    (setq b (polar a 0 w))
    (setq c (polar b (/ pi 2) h))
    (setq d (polar c pi w))
    ;根据a，b，c，d四个点绘制矩形
    (command "pline" a b c d "c")
  
  
  (setq file (open "E:\\wushipeng\\spacer\\result_648X480_start_1_21_1160.txt" "r")) ; 打开文件
  (if file
      (progn
        (setq xpos 0)
        (setq ypos height)
        (setq char (read-char file)) ; 逐个读取字符
        (while (not (null char))
          (if (equal char 32) ; 判断字符是否为空格（ASCII码为32）
              (progn 
                 ;(princ "  ")
              );progn
              (progn
                  (if (equal char 10)
                    (progn
                       ;  (princ "换行 ")
                    ; (princ ypos)
                     ; (princ "ypos:")
                      ;  (terpri)
                        (setq ypos (- ypos 1))
                        (setq xpos 0)
                     )
                     (progn
                      
                       ;; 1 的 ascii码为49， 2 的ascii码为50， 4 的ascii码为52
                        (if (equal char 49)
                          (progn
                          ;  (princ (strcat (chr char) " "))
                            
                            (setvar "cmdecho" 0)  ; 禁止命令行输出
                            
                            
                           ;;;;;;;;;;;;;绘制圆，表示柱子
                            (setq pt (list xpos ypos)) ; 定义坐标点 
                            (setq radius 0.054)
                            (command "circle" pt radius)
                            (setq ent (entmake (list '(0 . "POINT") (cons 10 pt)))) ; 创建点实体
                            
                            
                          );progn
                        );if
                       
                        (if (equal char 50)
                          (progn
                          ;  (princ (strcat (chr char) " "))
                            
                            (setvar "cmdecho" 0)  ; 禁止命令行输出
                            
                      
                            ;;;;;;;;;;;绘制notch
                            
                            
                             (setq base-point (list xpos+1 ypos+1)) 
                            (setq side1-length 0.38)
                            (setq side2-length 0.189)

                            ; 2-notch 画直角三角形
                            ; (setq point2 (polar base-point pi side1-length))
                            ;(setq point3 (polar base-point (/ pi -2) side2-length))
    
                            
                            
                            (command "pline" base-point point2 point3 base-point "")
                            
                            (setvar "cmdecho" 1)  ; 恢复命令行输出
                            
                          );progn
                        );if

                        (if (equal char 51)
                          (progn
                          ;  (princ (strcat (chr char) " "))
                            
                            (setvar "cmdecho" 0)  ; 禁止命令行输出
                            
                      
                            ;;;;;;;;;;;绘制notch
                            
                            
                             (setq base-point (list xpos-1 ypos-1)) 
                            (setq side1-length 0.38)
                            (setq side2-length 0.189)

                            ; 4-notch 画直角三角形
                            (setq point2 (polar base-point 0 side1-length))
                            (setq point3 (polar base-point (/ pi 2) side2-length))
                            
    
                            
                            
                            (command "pline" base-point point2 point3 base-point "")
                            
                            (setvar "cmdecho" 1)  ; 恢复命令行输出
                            
                          );progn
                        );if
                       
                        (setq xpos (+ xpos 1))
                       
                     );progn
                  );if
               );progn
             ) ;if
          (setq char (read-char file))
          ) ; while 继续读取下一个字符
        (close file) 
        princ 
         (command "_.zoom" "_extents" "") ; 调整视图以查看点
      
      )
      (princ "无法打开文件")))



