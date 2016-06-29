#!/usr/bin/env runghc
import Data.List
fact i = if i<0 then 0 else foldl' (*) 1 [1..i]
comb n k = if k<0||n<k then 0 else foldl' (\r i -> (r*(n-i) `div` (i+1))) 1 [0..k-1]
func n = foldl' (\r i -> r+(n-i)*(comb n (i+1))*i*(fact (n-i-1))) 0 [0..n]
main = readLn >>= print . func