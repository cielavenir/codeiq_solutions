#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input
hasattr(sys, 'set_int_max_str_digits') and sys.set_int_max_str_digits(999999999)

def mul(a1,b1,c1,d1,a2,b2,c2,d2):
	t=a1*a2
	u=b1*c2
	a0=t+u
	t=a1*b2
	u=b1*d2
	b0=t+u
	t=c1*a2
	u=d1*c2
	c0=t+u
	t=c1*b2
	u=d1*d2
	d0=t+u
	return [a0,b0,c0,d0]

def solve(n):
	a1=1
	b1=0
	c1=0
	d1=1
	a2=1
	b2=1
	c2=1
	d2=0
	n=(n+3)//2*2
	while n>0:
		if n%2>0: a1,b1,c1,d1=mul(a1,b1,c1,d1,a2,b2,c2,d2)
		a2,b2,c2,d2=mul(a2,b2,c2,d2,a2,b2,c2,d2)
		n>>=1
	return c1-1

if __name__ == '__main__':
	n=int(raw_input())
	print(solve(n))
