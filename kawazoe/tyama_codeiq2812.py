#!/usr/bin/python
import sys,ctypes
if sys.version_info[0]>=3:
	raw_input=input
	xrange=range

if sys.platform=='linux':
	libc=ctypes.cdll.LoadLibrary('libc.so.6')
	popcount=lambda n:libc.__sched_cpucount(ctypes.sizeof(ctypes.c_long),(ctypes.c_long*1)(n))
elif sys.platform=='darwin':
	libc=ctypes.cdll.LoadLibrary('libSystem.dylib')
	popcount=lambda n:libc.__popcountdi2(n)
else:
	popcount=lambda n:0 if n==0 else popcount(n/2)+n%2

print(1<<popcount(int(raw_input())))