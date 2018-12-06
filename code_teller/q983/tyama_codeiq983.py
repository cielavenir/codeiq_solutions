#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input

starting=5
bse=10
try:
	while True:
		n=int(raw_input())
		n+=starting-2
		digits=1
		expbase=1
		while True:
			x=digits*expbase*(bse-1)
			if x>n:break
			n-=x
			digits+=1
			expbase*=bse
		num=expbase+n//digits
		d=digits-1-n%digits
		for _ in range(d): num//=bse
		print(num%bse)
except EOFError:
	pass