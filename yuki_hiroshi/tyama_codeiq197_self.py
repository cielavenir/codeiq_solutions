#!/usr/bin/python
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

from functools import reduce
N=280671392065546467397265294532969672241810318954163887187279320454220348884327
table=rho(N)
l=len(table)
m=N*2+1
r=None
for i in xrange(3**(l-2)*2):
	table2=[[] for _ in xrange(3)]
	for j,e in enumerate(table): table2[i//3**j%3].append(e)
	edge=[reduce(lambda x,y:x*y,e,1) for e in table2]
	surface=edge[0]*edge[1]+edge[1]*edge[2]+edge[2]*edge[0]
	if surface<m:
		m=surface
		r=table2
print('x'.join(map(str,sorted(reduce(lambda x,y:x*y,e,1) for e in r))))
