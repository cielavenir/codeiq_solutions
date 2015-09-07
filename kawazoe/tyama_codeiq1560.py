#!/usr/bin/python
#coding:utf-8
from functools import reduce
import itertools

def solve(factor,ma):
	r=0
	for n in range(1,len(factor)+1):
		for a in itertools.combinations(factor,n):
			divisor=reduce(lambda x,y:x*y,a)
			items=ma//divisor
			items_sum=items*(items+1)//2
			r+=(-1)**((n-1)%2) * items_sum*divisor
	return r

factor=[3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
print(solve(factor,1000))
print(solve(factor,100000))
print(solve(factor,1000000000))