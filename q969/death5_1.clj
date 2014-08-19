(print (apply str (map (fn [i] (cond
	(zero? (mod i 15)) "FIZZBUZZ"
	(zero? (mod i 3)) "fizz"
	(zero? (mod i 5)) "buzz"
	:else i
)) (range 1 51))))