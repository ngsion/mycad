(defun repeaty ()
  (setq i 1)
  (setq sum 0)
  (repeat 100 
     (setq sum (+ i sum))
    (setq i (1+ i))
  );
  (princ sum)
  princ
)

(defun whilety ()
  (setq i 1)
  (setq sum 0) 
  (while (<= i 100) 
     (setq sum (+ i sum))
    (setq i (1+ i))
  );
  (princ sum)
  princ
)

(defun score ()
  (setq  a  (getreal "input your score:"))
  (cond  ((= a 100) (princ "\n very good"))
        ((>= a 90) (princ "\n good"))
    ((>= a 80) (princ "\n not bad"))
    (t (princ "\n come on"))
  )
  princ
  
)

(defun circlety ()
  (setq center (getpoint "input the center:"))
  (setq rad (getdist center "\n radius"))
  (if (> rad 0)
     (progn
       (command "circle" center rad)

     )
     (progn
       (alert "\nproblem")
       princ
     )
    
  
  )
  
)