#!/usr/bin/python
#cannot use on online judge.

import sys,itertools,sympy
from functools import partial,reduce
if sys.version_info[0]>=3: raw_input=input

def drop_prev_n(check,n,prev):
	a=[next(prev) for _ in range(n)]
	while True:
		nxt=next(prev)
		if not check(nxt): yield a[0]
		a.pop(0)
		a.append(nxt)

f=partial(drop_prev_n,lambda n:sum(sympy.factorint(n).values())==1)
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
