(map (lambda (i) (display (cond
	((zero? (modulo (+ 1 i) 15)) "FIZZBUZZ")
	((zero? (modulo (+ 1 i) 3)) "fizz")
	((zero? (modulo (+ 1 i) 5)) "buzz")
	(else (+ 1 i))
))) (iota 50))