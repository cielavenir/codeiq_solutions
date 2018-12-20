#!/usr/bin/python
import sys,itertools
def isqrt(n):
	if n<=0: return 0
	if n<4: return 1
	x,y=0,n
	while x!=y and x+1!=y:
		x,y=y,(n//y+y)//2
	return x

def composite_numbers():
	for i in itertools.count(4):
		if any(not i%j for j in range(2,isqrt(i)+1)):
			yield i

print(sum(itertools.islice(composite_numbers(),int(sys.stdin.readline()))))
