#!/usr/bin/env clisp

#|
; GNU clisp does not optimize tail call.
(defun calc (r i n)
	(let ((x (- n (truncate (* i (- i 1)) 2))))
		(if (>= x i)
			(if (= 0 (mod x i))
				(calc (+ r (truncate x i)) (+ i 1) n)
				(calc r (+ i 1) n)
			)
			r
		)
	)
)
|#

(defun calc (r i n)
	(let ((x 0))
		(loop
			(setq x (- n (truncate (* i (- i 1)) 2)))
			(if (< x i) (return r))
			(if (= 0 (mod x i)) (setq r (+ r (truncate x i))))
			(setq i (+ i 1))
		)
	)
)			

(defun ma ()
	(let ((n (read nil nil)))
		(if (and (not (eql n nil)) (not (= n 0))) (progn
			(write (calc 0 2 n))
			(fresh-line)
			(ma)
		))
	)
)

(ma)