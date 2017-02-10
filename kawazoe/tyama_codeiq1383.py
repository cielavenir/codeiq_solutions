#!/usr/bin/python
#coding:utf-8
import sys,itertools
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

def rho3(n):
	#get one divisor
	def rhonext(x,n,seed): return (x*x+seed)%n
	for seed in [1,3,5]: #todo#
		x=y=1 #todo#
		q=i=1
		while True:
			if i==q:
				y=x
				q*=2
			x=rhonext(x,n,seed)
			d=gcd(abs(x-y),n)
			if d>1:
				if d==n: break
				return d
			i+=1
	return None

def rho2(n):
	#get all divisors
	r=[]
	while n>1:
		if miller_rabin(n):
			return r+[n]
		else:
			x=rho3(n)
			if not x:
				#STDERR.puts 'suspicious: %d'%n
				return r+[n]
			r+=rho2(x)
			n//=x
	return r

def rho(n):
	#pass to collections.Counter() to get
	#the similar result to Ruby's Prime.prime_division.
	r=[]
	if n<0:
		r.append(-1)
		n=-n
	if n<2: return r
	for e in [2]: #todo#
		while n%e==0:
			n//=e
			r.append(e)
	if n==1: return r
	return r+rho2(n)

def take_prime(prev):
	before=0
	for e in (i for i in itertools.count(1) if miller_rabin(i)):
		d=e-before
		for _ in range(d-1): next(prev)
		yield next(prev)
		before=e

#Q1
f=[3,0,2]
c=1
for i in itertools.count(3):
	f.append(f[i-3]+f[i-2])
	if f[i]%i==0:
		c+=1
		if c==30:
			idx=i
			break
P=f[idx]
print('P = '+str(P))
#Q2
Q=max(rho(P))
print('Q = '+str(Q))
#Q3
r=0
it=take_prime(i for i in itertools.count(0) if miller_rabin(i))
for e in itertools.takewhile(lambda e:e<=Q,it): r+=e
print('R = '+str(r))

'''
【解答】
P = 63088012960224
Q = 120739
R = 72834276
【言語】
Python
【コード】
'''
