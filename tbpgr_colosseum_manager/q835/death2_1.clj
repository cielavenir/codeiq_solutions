(print (clojure.string/join "" (map (fn [i]
  (clojure.string/join "" (map (fn [x] (char (+ x i))) '(97 65 12354 12450 12450 12354 65 97)))
) (range 26))))