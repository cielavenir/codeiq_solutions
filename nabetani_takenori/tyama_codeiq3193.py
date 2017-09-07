#!/usr/bin/env python
import sys
if sys.version_info[0]>=3: xrange=range
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

a,b,c=map(int,sys.stdin.readline().split())
primes=[e for e in range(b,c+1) if miller_rabin(e)]
bag=[0]*(a+1)
bag[0]=1
for e in range(b,c+1):
	if not miller_rabin(e): continue
	for i in range(a,e-1,-1):
		bag[i]+=bag[i-e]
print(bag[a])
