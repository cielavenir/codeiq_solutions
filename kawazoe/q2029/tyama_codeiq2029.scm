#!/usr/bin/env gosh

(define (calc r i n)
	(let ((x (- n (quotient (* i (- i 1)) 2))))
		(if (>= x i)
			(if (zero? (modulo x i))
				(calc (+ r (quotient x i)) (+ i 1) n)
				(calc r (+ i 1) n)
			)
			r
		)
	)
)

(define (ma)
	(let ((n (read)))
		(if (and (not (eof-object? n)) (not (zero? n))) (begin
			(write (calc 0 2 n))
			(newline)
			(ma)
		))
	)
)

(ma)