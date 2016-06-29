#!/usr/bin/env runghc
import Control.Applicative
import Data.List

split p [] = []
split p s = x : (split p $ dropWhile p $ y)
	where (x,y) = break p s

fact i = if i<0 then 0 else foldl' (*) 1 [1..i]
comb n k = if k<0||n<k then 0 else foldl' (\r i -> (r*(n-i) `div` (i+1))) 1 [0..k-1]
func' n m i r = if i>n then r else func' n m (i+m) (r+(comb n i)*(fact i) `div` (fact (i `div` m))^m)
func n m = if m==0 then 0 else func' n m 0 0

main = do
	[m,n] <- (map read . (split (== ','))) <$> getLine
	print $ func n m