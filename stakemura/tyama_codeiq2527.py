#!/usr/bin/env python
#coding:utf-8
import math,functools,sys
if sys.version_info[0]>=3: raw_input=input

def compare(i,j):
	xa,xb,xc=A[i]
	ya,yb,yc=A[j]
	# 指数変換 n=z**Math.log(n,z)
	# xb**xc * Math.log(xa) <=> yb**yc * Math.log(ya)
	# xb**xc * Math.log(xa) <=> (xb**Math.log(yb,xb))**yc * Math.log(ya)
	# xb**(xc - Math.log(yb,xb)*yc) <=> Math.log(ya)/Math.log(xa)
	# xb**(xc - Math.log(yb,xb)*yc) - Math.log(ya)/Math.log(xa) <=> 0
	try:
		return xb**(xc - math.log(yb,xb)*yc) - math.log(ya)/math.log(xa)
	except OverflowError:
		return float('inf')

A=[]
try:
	while True:
		A.append([float(e) for e in raw_input().split(',')])
except EOFError:
	pass

print(max(list(range(len(A))),key=functools.cmp_to_key(compare)))