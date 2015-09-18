#!/usr/bin/env runghc
import Control.Applicative
import System.IO (isEOF)

calc r i n = do
	let x = n-(div (i*(i-1)) 2)
	if x>=i then do
		if (mod x i)==0 then
			calc (r+(div x i)) (i+1) n
		else
			calc r (i+1) n
	else
		r

main = do
	eof <- isEOF
	if not eof then do
		n <- readLn
		if n>0 then do
			putStrLn $ show $ calc 0 2 n
			main
		else return()
	else return ()