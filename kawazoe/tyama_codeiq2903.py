#!/usr/bin/python
from collections import defaultdict
import sys,subprocess,operator
if sys.version_info[0]>=3:
	from functools import reduce
	raw_input=input
	xrange=range

def prime_division(n):
	h=defaultdict(int)
	line=subprocess.check_output(['factor',str(n)])
	for e in line.split()[1:]: h[int(e)]+=1
	return [(k,v) for k,v in h.items()]

M=1000003
N=int(raw_input())
print(reduce(
	lambda s,e:s*(pow(e[0],e[1]+1,M)-1)*pow(e[0]-1,M-2,M)%M,
	[(e[0],e[1]*N) for e in prime_division(reduce(operator.mul,xrange(1,N+1)))],
1))