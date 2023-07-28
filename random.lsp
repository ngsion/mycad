;;from internet  
(defun random ()  
  (setq seed (if seed  
           (rem (+ (* seed 15625.7) 0.21137152) 1)  
           0.3171943  
         )  
  )  
)  
(defun random-n (n)  
  (* n (random))  
)  
(defun entmakepoint (pt layer)  
  (entmake (list (cons 0 "POINT")   
                 (cons 8 layer);***  
         (cons 6 "BYLAYER")   
         (cons 10 pt) ;***  
         (cons 39 0.0)   
         (cons 50 0.0)   
         (cons 62 256)   
         (cons 210 (list 0.0 0.0 1.0))  
       )  
  )  
)  
;;generate random points  
(defun c:test1 ()  
  (repeat 10000  
    (entmakepoint (list (random-n 100000) (random-n 60000) 0) "0")  
  )  
)  