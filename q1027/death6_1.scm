(map (lambda (i) (if
	(every (lambda (j) (> (modulo (+ 2 i) (+ 2 j)) 0)) (iota i))
	(begin (if (< 0 i) (display ":")) (display (+ 2 i)))
)) (iota 999))