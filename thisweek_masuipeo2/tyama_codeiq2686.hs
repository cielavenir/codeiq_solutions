#!/usr/bin/env runghc
import Control.Applicative

split p [] = []
split p s = x : (split p $ dropWhile p $ y)
	where (x,y) = break p s

fact' i r = if i<1 then r else fact' (i-1) (r*i)
fact i = fact' i 1
comb' n k i r = if i==k then r else comb' n k (i+1) (r*(n-i) `div` (i+1))
comb n k = comb' n k 0 1
func' n m i r = if i>n then r else func' n m (i+m) (r+(comb n i)*(fact i) `div` (fact (i `div` m))^m)
func n m = if m==0 then 0 else func' n m 0 0

main = do
	[m,n] <- (map read . (split (== ','))) <$> getLine
	print $ func n m