#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input
sys.setrecursionlimit(3000)

memo={}
def dfs(cur,d,c):
	if c<0 or cur==4:return 0
	if cur==0:return 1
	x=tuple([cur,d,c])
	if x not in memo:memo[x]=dfs(cur-d,-d,c-1)+dfs(cur+d,d,c)
	return memo[x]

n=int(raw_input())
print(dfs(2,1,n))