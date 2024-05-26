(defun c:myplot () 

  (setq insunits 4) ; 设置坐标单位为毫米

  (setq cmdecho (getvar "cmdecho"))
  (setq osmode (getvar "osmode"))

  (setvar "cmdecho" 0) ; 禁止命令行输出
  (setvar "osmode" 0) ;  关闭捕捉模式


  (setq current-precision (getvar "luprec"))
  (setq new-precision 4) ; 设置新的线性单位精度（小数点后4位）
  (setvar "luprec" new-precision)
  (setq scaling-factor (/ 0.184 1.0)) ; 计算新的单位缩放因子, cross 间距0.184mm，在这里是1， 这里的长度除以5.435就得到真实的，单位为mm
  (setvar "dimlfac" scaling-factor)
  (setq annotative-scale (/ 0.184 1.0))
  (setvar "dimscale" annotative-scale)
  (princ "Custom units set successfully.")


  (setq width 648)
  (setq height 480)
  (setq radius 0.0386) ;柱子半径为7.1微米
  (setq radi 0.0435) ; 银浆半径为8微米
  (setq margin 0.217) ; 银浆离像素墙中心的距离为40微米
  (setq semi-height (/ height 2))
  (setq semi-width (/ width 2))


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


  (setq file (open "F:\\mycad\\mycad\\result_648X480_start_1_21_1160.txt" "r")) ; 打开文件
  (if file 
    (progn 
      (setq xpos 0)
      (setq ypos height)
      (setq char (read-char file)) ; 逐个读取字符
      (while (not (null char)) 
        (if (equal char 32)  ; 判断字符是否为空格（ASCII码为32）
          (progn 
            ;(princ "  ")
          ) ;progn
          (progn 
            (if (equal char 10) 
              (progn 
                ;  (princ "换行 ")
                ; (princ ypos)
                ; (princ "ypos:")
                ;  (terpri)
                (setq ypos (- ypos 1))
                (setq xpos 0)
              ) ; progn
              (progn 

                ;;;左上1/4区域不打印
                (if (and (< xpos semi-width) (> ypos semi-height)) 
                  (progn 

                    (setq xpos (+ xpos 1))
                  )
                  (progn 

                    ;;;右上角只打印2
                    (if (> ypos semi-height) 
                      (progn 

                        (setq xx (+ xpos 1))
                        (setq xxx (- xx margin))
                        (setq yy (+ ypos 1))
                        (setq yyy (- yy margin))

                        (setq pt (list xxx yyy))

                        (command "circle" pt radi)

                        (setq xpos (+ xpos 1))
                      )
                      (progn 

                        ;; 1 的 ascii码为49， 2 的ascii码为50， 4 的ascii码为52

                        (if (equal char 50) 
                          (progn 

                            ;  (princ (strcat (chr char) " "))
                            ;;;;;;;;;;;绘制

                            (setq xx (+ xpos 1))
                            (setq xxx (- xx margin))
                            (setq yy (+ ypos 1))
                            (setq yyy (- yy margin))

                            (setq pt (list xxx yyy))

                            (command "circle" pt radi)

                            (setq xpos (+ xpos 1))
                          ) ;progn
                          (progn 
                            (if (equal char 49) 
                              (progn 
                                ;;;;;;;;;;;;;绘制圆，表示柱子
                                ;(setq pt (list xpos ypos)) ; 定义坐标点

                                ;(command "circle" pt radius)

                                (setq xpos (+ xpos 1))
                              ) ; progn

                              (progn 

                                (if (equal char 52) 
                                  (progn 

                                    (setq pt1 (list xpos ypos)) ; 定义坐标点


                                    (setq xx (- xpos 1))
                                    (setq xxx (+ xx margin))
                                    (setq yy (- ypos 1))
                                    (setq yyy (+ yy margin))

                                    (setq pt (list xxx yyy))


                                    (command "circle" pt radi)

                                    (setq xpos (+ xpos 1))
                                  ) ;progn
                                ) ;if
                              ) ;progn
                            ) ;if
                          ) ;progn
                        ) ;if
                      )
                    )
                  )
                )
              ) ;progn
            ) ;if
          ) ;progn
        ) ;if
        (setq char (read-char file))
      ) ; while 继续读取下一个字符
      (princ "plot finish.")

      (close file)
      princ

      (command "_.zoom" "_extents" "") ; 调整视图以查看点
    )
    (princ "无法打开文件")
  ) ; if

  (setvar "cmdecho" cmdecho) ; 恢复命令行输出
  (setvar "osmode" osmode) ;恢复捕捉
)



