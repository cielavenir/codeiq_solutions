#!/usr/bin/env gosh

(define (calc2 d num bse)
	(if (zero? d)
		(modulo num bse)
		(calc2 (- d 1) (quotient num bse) bse)
	)
)
(define (calc digits expbase bse x n)
	(if (> x n)
		(calc2 (- (- digits 1) (modulo n digits)) (+ expbase (quotient n digits)) bse)
		(calc (+ digits 1) (* expbase bse) bse (* (* (+ digits 1) (* expbase bse)) (- bse 1)) (- n x))
	)
)

(define (ma)
	(let ((n (read)))
		(if (not (eof-object? n)) (begin
			(write (calc 1 1 10 9 (+ n 3)))
			(newline)
			(ma)
		))
	)
)

(ma)