f 25=return()
f i=do
	putStrLn((replicate i 'A')++[toEnum(i+66)]++(replicate(24-i)'A'))
	f(i+1)
main=f 0