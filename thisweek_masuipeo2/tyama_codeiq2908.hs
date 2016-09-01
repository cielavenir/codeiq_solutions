#!/usr/bin/env runghc
import Control.Applicative
import Data.List

func m n mi = if m==1 then 1 else foldl' (\s i -> s+(func (m-1) (n-i) i)) 0 [mi..(div n m)]

main =
	(map read . words) <$> getLine >>= \[m,n] ->
		print $ if m==1 then 1 else foldl' (\s d ->
			s+(if (mod n d)==0 then (func (m-1) ((div n d)-1) 1) else 0)
		) 0 [1..(div n m)]