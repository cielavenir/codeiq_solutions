#!/usr/bin/booi
import System

while 1:
	s=Console.ReadLine()
	if s==null: break
	n=long.Parse(s)
	if n==0: break
	r as long=0
	i as long=2
	while 1:
		x=n-i*(i-1)/2
		if x<i: break
		if x%i==0:
			r+=x/i
		i+=1
	print(r)