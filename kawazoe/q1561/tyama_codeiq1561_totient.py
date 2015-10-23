#!/usr/bin/python
#coding:utf-8
from collections import defaultdict
from functools import reduce
import sys
if sys.version_info[0]>=3: raw_input=input

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

totient=lambda n:reduce(lambda s,e:s*(e[0]-1)*e[0]**(e[1]-1),factor(n).items(),1)

M=1000000
REV3=pow(3,totient(M)-1,M)
n=int(raw_input())
print((pow(16,n,M)-1)*2*REV3%M)