#!/usr/bin/python
from collections import defaultdict
from functools import reduce
try:
	import sympy
	factor=sympy.factorint
except ImportError:
	try:
		import nzmath
		factor=nzmath.factor.methods.factor
	except ImportError:
		import sys
		print('sympy or nzmath is required')
		sys.exit(1)

def solve(h):
	return (reduce(lambda s,e:s*(2*e[1]+1),h.items(),1)+1)//2
def range_factor(r):
	h=defaultdict(int)
	for i in r:
		for e in factor(i).items(): h[e[0]]+=e[1]
	return h

print(solve(factor(24)))
print(solve(factor(720)))
print(solve(range_factor(range(1,51))))

# print (reduce(lambda s,e:s*(2*e[1]+1),__import__('sympy').factorint(reduce(lambda a,b:a*b,range(1,51))).items(),1)+1)/2