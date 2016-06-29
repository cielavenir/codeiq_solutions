#!/usr/bin/env runghc
import Control.Applicative

split p [] = []
split p s = x : (split p $ dropWhile p $ y)
	where (x,y) = break p s

main =
	(map read . (split (== ','))) <$> getLine >>= \[m,n] ->
		let g = gcd m n in
		let h = (m `div` g) * n in
		print h
		>> print (h * (if g==1 then 1 else 2))