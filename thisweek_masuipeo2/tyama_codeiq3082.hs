#!/usr/bin/env runghc
import Control.Applicative
import Data.List
comb n k = if k<0||n<k then 0 else foldl' (\r i -> (r*(n-i) `div` (i+1))) 1 [0..k-1]
main = (map read . words) <$> getLine >>= \[n,a,b] -> print $ (comb (n-2) (a-2)) * (comb (a-2) (b-2))
