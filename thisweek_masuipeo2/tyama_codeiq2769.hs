#!/usr/bin/env runghc
import Control.Applicative

split p [] = []
split p s = x : (split p $ dropWhile p $ y)
	where (x,y) = break p s

main = do
	[m,n] <- (map read . (split (== ','))) <$> getLine
	let g = gcd m n
	let h = (m `div` g) * n
	print h
	print (h * (if g==1 then 1 else 2))