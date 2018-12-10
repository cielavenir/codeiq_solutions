#!/usr/bin/python
import sys,itertools
try:
	import isqrt
	def stop(n):
		return isqrt.isqrt(n)+1
except:
	def stop(n):
		return n

def composite_numbers():
	for i in itertools.count(4):
		if any(not i%j for j in range(2,stop(i))):
			yield i

print(sum(itertools.islice(composite_numbers(),int(sys.stdin.readline()))))
