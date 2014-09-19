(doall (map (fn [i] (if
	(every? (fn [j] (> (mod i j) 0)) (range 2 i))
	(do (if (< 2 i) (print ":")) (print i))
)) (range 2 999)))