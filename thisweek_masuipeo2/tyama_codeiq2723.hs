#!/usr/bin/env runghc
import Data.List

-- A094047
fact i = if i<0 then 0 else foldl' (*) 1 [1..i]
comb n k = if k<0||n<k then 0 else foldl' (\r i -> (r*(n-i) `div` (i+1))) 1 [0..k-1]
func n = foldl' (\r i -> r + (-1)^i * (fact (n-i-1)) * (comb (2*n-i-1) i)) 0 [0..n-1]

main = readLn >>= \n -> print $ (-1)^n * 2 * (fact (n-1)) + (fact n) * (func n)