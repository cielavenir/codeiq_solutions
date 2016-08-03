#!/usr/bin/env runghc
import Control.Applicative
import Data.List

split p [] = []
split p s = x : (split p $ dropWhile p $ y)
	where (x,y) = break p s

comb n k = if k<0||n<k then 0 else foldl' (\r i -> (r*(n-i) `div` (i+1))) 1 [0..k-1]

main =
	(map read . (split (== ','))) <$> getLine >>= \[a,b,c] ->
		print $ foldl' (\s i -> s+(comb (a-1) i)*(comb (b-1) (c-i-1))*(comb (c-1) i)) 0 [0..c-1]