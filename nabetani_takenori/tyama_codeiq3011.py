#!/usr/bin/python
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
#import sympy
from functools import partial,reduce
if sys.version_info[0]>=3: raw_input=input

def drop_prev_n(check,n,prev):
	a=[next(prev) for _ in range(n)]
	while True:
		nxt=next(prev)
		if not check(nxt): yield a[0]
		a.pop(0)
		a.append(nxt)

f=partial(drop_prev_n,
	#lambda n:sum(sympy.factorint(n).values())==1
	lambda n:miller_rabin(n)
)
if __name__=='__main__':
	try:
		while True:
			print(','.join(
				map(str,itertools.islice(
					reduce(lambda s,e:f(e,s),map(int,raw_input().split()),itertools.count(0)),
				10))
			))
	except EOFError:
		pass
