#!/usr/bin/env runghc
import Control.Applicative
import System.IO (isEOF)

calc2 0 num bse =
	mod num bse
calc2 d num bse =
	calc2 (d-1) (div num bse) bse

calc digits expbase bse x n =
	if x>n then
		calc2 (digits-1-(mod n digits)) (expbase+(div n digits)) bse
	else
		calc (digits+1) (expbase*bse) bse ((digits+1)*(expbase*bse)*(bse-1)) (n-x)

main = do
	eof <- isEOF
	if not eof then do
		n<-readLn
		print $ calc 1 1 10 9 (n+3)
		main
	else return ()