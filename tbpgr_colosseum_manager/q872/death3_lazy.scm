(load "../lazier.scm")
(load "../prelude.scm")
(load "../prelude-numbers.scm")

(lazy-def '(ans2 z x)
 '(if (= x 123) end-of-output (cons x (z z (succ x))))
)

(lazy-def '(ans in)
 '(ans2 ans2 65)
)

(print-as-unlambda (laze 'ans))

; Well, I didn't know that LazyK-Unlambda is not compatible with Unlambda.