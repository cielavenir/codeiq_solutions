(loop for i from 2 to 999 do (if
	(loop for j from 2 to (- i 1) always (> (mod i j) 0))
	(progn (if (< 2 i) (princ ":")) (prin1 i))
))