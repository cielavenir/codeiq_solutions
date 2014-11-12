(loop for i from 1 to 50 do (princ (cond
	((= 0 (mod i 15)) "FIZZBUZZ")
	((= 0 (mod i 3)) "fizz")
	((= 0 (mod i 5)) "buzz")
	(t i)
)))