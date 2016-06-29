#!/usr/bin/env runghc
import Control.Applicative

split p [] = []
split p s = x : (split p $ dropWhile p $ y)
	where (x,y) = break p s

main =
	(map read . (split (== ','))) <$> getLine >>=
		\[n,m] -> print $ n+m-1

-- 一筆書きできる条件は「奇点が0か2」なので、分割できるのは1回まで。よって、n+m-1が答え。