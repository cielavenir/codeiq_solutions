(doall (map (fn [i]
	(println (str (apply str (repeat i "A")) (char (+ 66 i)) (apply str (repeat (- 24 i) "A"))))
) (range 0 25)))