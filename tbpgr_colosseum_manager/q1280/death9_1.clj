(doall (map (fn [i]
	(print (char (- (+ 97 (mod i 26)) (* (quot (- 8 (mod i 8)) 8) 32))))
) (range 0 208)))