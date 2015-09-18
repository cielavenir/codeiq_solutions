#!/usr/bin/clojure

(defn calc [r i n]
	(let [x (- n (quot (* i (- i 1)) 2))]
		(if (>= x i)
			(if (= 0 (rem x i))
				(recur (+ r (quot x i)) (+ i 1) n)
				(recur r (+ i 1) n)
			)
			r
		)
	)
)

(defn ma []
	(let [n (read *in* nil nil)]
		(if (and (not (= n nil)) (not (zero? n))) (do
			(println (calc 0 2 n))
			(ma)
		))
	)
)
(ma)