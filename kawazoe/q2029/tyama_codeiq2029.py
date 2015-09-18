#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input

try:
	while True:
		n=int(raw_input())
		if n==0: break
		r=0
		i=1
		while 1:
			n-=i
			if n<0: break
			i+=1
			if n%i==0: r+=n//i
		print(r)
except EOFError:
	pass