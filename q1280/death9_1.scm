; not usable in chicken, because iota is not implemented
(map (lambda (i) (display(integer->char(- (+ 97 (modulo i 26)) (* (quotient (- 8 (modulo i 8)) 8) 32))))) (iota 208))