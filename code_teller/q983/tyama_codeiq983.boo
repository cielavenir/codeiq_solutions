#!/usr/bin/booi
import System

starting as long=5
bse=10
while 1:
	s=Console.ReadLine()
	if s==null: break
	n=long.Parse(s)+starting-2
	digits as long=1
	expbase as long=1
	while 1:
		x=digits*expbase*(bse-1)
		if x>n:break
		n-=x
		digits+=1
		expbase*=bse
	num=expbase+n/digits
	d=digits-1-n%digits
	while d>0:
		num/=bse
		d-=1
	print(num%bse)