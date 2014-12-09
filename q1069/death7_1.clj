(doall (map (fn [c]
	(print (str ">" (apply str (repeat (int c) "+")) "."))
) "deathma colosseum"))