#!/usr/bin/env runghc
import Control.Applicative
import Data.List
import Data.Bits

split p [] = []
split p s = x : (split p $ dropWhile p $ y)
	where (x,y) = break p s

findzero h n = if (mod h 2)==0 then n else findzero (div h 2) (n+1)

dfs::Int->Int->Int->Int->Int->Int->Int
dfs h n st s t m =
	if n==0 then
		1
	else
		let end_pos = if s==0 then st else m in
		foldl' (\r e -> 
			if s+e<=t && (mod (shift h (-e)) 2)==0 then
				let h' = h+(shift 1 e) in
				r+(if (s+e)==t then (dfs h' (n-1) (findzero (div h' 2) 1) 0 t m) else (dfs h' n (e+1) (s+e) t m))
			else
				r ) 0 [st..end_pos]

func m n =
	let s = div (m*(m+1)) 2 in
	if (mod s n)>0 then 0 else (dfs 0 n 1 0 (div s n) m)

main =
	(map read . (split (== ','))) <$> getLine >>= \[m,n] ->
		print $ func m n