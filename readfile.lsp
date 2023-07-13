(defun PrintLine ( message / )	
	(princ message)
	(princ "\n")
   (princ))			; Clean exit (hide last return value)


(defun ReadFile()
   (setq #file (open "F:\mycad\mycad\result_128X128_start_7_3_250.txt"  "r"))
   (setq #strContext (read-line #file))
   (princ #strContext)
   (princ "\n")
    (princ)	
)