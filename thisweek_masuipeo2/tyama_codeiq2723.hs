#!/usr/bin/env runghc

-- A094047
fact' i r = if i<1 then r else fact' (i-1) (r*i)
fact i = fact' i 1
comb' n k i r = if i==k then r else comb' n k (i+1) (r*(n-i) `div` (i+1))
comb n k = comb' n k 0 1
func' n i r = if i==n then r else func' n (i+1) (r + (-1)^i * (fact (n-i-1)) * (comb (2*n-i-1) i))
func n = func' n 0 0

main = do
	n <- readLn
	print $ (-1)^n * 2 * (fact (n-1)) + (fact n) * (func n)