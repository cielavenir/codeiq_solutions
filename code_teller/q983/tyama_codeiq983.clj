#!/usr/bin/clojure

(defn calc2 [d num bse]
	(if (zero? d)
		(rem num bse)
		(recur (- d 1) (quot num bse) bse)
	)
)
(defn calc [digits expbase bse x n]
	(if (> x n)
		(calc2 (- (- digits 1) (rem n digits)) (+ expbase (quot n digits)) bse)
		(recur (+ digits 1) (* expbase bse) bse (* (* (+ digits 1) (* expbase bse)) (- bse 1)) (- n x))
	)
)

(defn ma []
	(let [n (read *in* nil nil)]
		(if (not (= n nil)) (do
			(println (calc 1 1 10 9 (+ n 3)))
			(ma)
		))
	)
)
(ma)