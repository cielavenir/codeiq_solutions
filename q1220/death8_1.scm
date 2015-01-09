(map (lambda (i)
	(display (string-append (make-string i #\A) (string (integer->char (+ 66 i))) (make-string (- 24 i) #\A)))
	(newline)
) (iota 25))