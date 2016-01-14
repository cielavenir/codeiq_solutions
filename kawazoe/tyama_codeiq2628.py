#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input

try:
	while True:
		a,b=map(int,raw_input().split())
		if a==0: break
		n=b*b-a*a
		r=0
		i=1
		while 1:
			x=n-i*(i-1)
			if x//i//2<=0: break
			if x%i==0 and x//i%2==1:
				r+=x//i//2 + x//i//2+i
			i+=1
		print(r)
except EOFError:
	pass