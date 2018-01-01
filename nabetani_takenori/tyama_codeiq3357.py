#!/usr/bin/env python
D=[[0,0],[1,0],[2,0],[2,1],[2,2],[1,2],[0,2],[0,1]]
import sys
if sys.version_info[0]>=3: raw_input=input

def num2place(n):
	n-=1
	x=y=0
	z=1
	while n>0:
		x+=D[n%8][0]*z
		y+=D[n%8][1]*z
		n//=8
		z*=3
	return (x,y)

def place2num(x,y):
	n=0
	z=1
	if x<0 or y<0: return None
	while x>0 or y>0:
		try:
			idx=D.index([x%3,y%3])
		except ValueError:
			return None
		n+=idx*z
		x//=3
		y//=3
		z*=8
	return n+1

try:
	while True:
		x,y=num2place(int(raw_input()))
		a=[place2num(x+dx,y+dy) for (dx,dy) in [(0,-1),(-1,0),(1,0),(0,1)]]
		b=sorted(e for e in a if e is not None)
		print(','.join(str(e) for e in b))
		sys.stdout.flush()
except EOFError:
	pass
