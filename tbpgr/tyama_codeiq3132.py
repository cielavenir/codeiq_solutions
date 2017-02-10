#!/usr/bin/env python
#cf: codeiq3011/hena24
import sys
if sys.version_info[0]>=3:
	xrange=range
	raw_input=input

from fractions import gcd
def miller_rabin(n):
	n=abs(n) #todo#
	if n==2: return True
	if n==1 or n%2==0: return False
	d=n-1
	s=0
	while d%2==0:
		d//=2
		s+=1
	a=1
	for _ in xrange(5): #todo#
		a+=1
		while gcd(a,n)!=1: a+=1 #todo#
		r=pow(a,d,n)
		if r==1 or r==n-1: continue
		for j in xrange(s):
			r=pow(r,2,n)
			if r==n-1: break
		else:
			return False
	return True

import itertools
def take_prime(prev):
	before=0
	for e in (i for i in itertools.count(0) if miller_rabin(i)):
		d=e-before
		for _ in range(d-1): next(prev)
		yield next(prev)
		before=e

if __name__=='__main__':
	try:
		while True:
			it=take_prime(i for i in itertools.count(0) if miller_rabin(i))
			for _ in range(int(raw_input())-1): next(it)
			print(next(it))
	except EOFError:
		pass
