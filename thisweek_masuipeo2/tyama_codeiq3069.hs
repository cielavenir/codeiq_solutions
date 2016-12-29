#!/usr/bin/env runghc
import Data.List
comb n k = if k<0||n<k then 0 else foldl' (\r i -> (r*(n-i) `div` (i+1))) 1 [0..k-1]
main = readLn >>= \n -> print $ foldl' (\s i -> s+(comb n i)*(i-1)*(n-i-1)) 0 [2..n-2]
