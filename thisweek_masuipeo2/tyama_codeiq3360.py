#!/usr/bin/python
### previous code is important, really. ###
b=lambda s,c: ((s[0]==c and s[1]==c and s[2]==c)or(s[3]==c and s[4]==c and s[5]==c)or(s[6]==c and s[7]==c and s[8]==c)or(s[0]==c and s[3]==c and s[6]==c)or(s[1]==c and s[4]==c and s[7]==c)or(s[2]==c and s[5]==c and s[8]==c)or(s[0]==c and s[4]==c and s[8]==c)or(s[2]==c and s[4]==c and s[6]==c))

r=[0]*9
def dfs(st,s,n):
	for i in range(0,9):
		if s[i]<0:
			s[i]=n%2
			if b(s,n%2):
				r[n]+=1
			else:
				st_orig=st[n%2]
				st[n%2]=i+1
				dfs(st,s,n+1)
				st[n%2]=st_orig
			s[i]=-1


dfs([0,0],[-1]*9,0)
import sys
print(r[int(sys.stdin.read())-1])
