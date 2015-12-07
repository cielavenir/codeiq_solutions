#!/usr/bin/python
#coding:utf-8

#610(通り)

n=20
t=[[
	'||',
	'||',
	'||',
],[
	'---',
	'---',
]]

def dfs(m,x,y,d):
	if x==len(m[0]) and y==0: return 1
	if y==len(m):             return dfs(m,x+1,0,d)
	if m[y][x]:               return dfs(m,x,y+1,d)

	r=0
	for e in t:
		if all(
			all(y+_y<len(m) and x+_x<len(m[y+_y]) and not m[y+_y][x+_x] for _x in range(len(e[_y])))
			for _y in range(len(e))
		):
			for _y in range(len(e)):
				for _x in range(len(e[_y])): m[y+_y][x+_x]=e[_y][_x]
			r+=dfs(m,x,y+1,d-1)
			for _y in range(len(e)):
				for _x in range(len(e[_y])): m[y+_y][x+_x]=None
	return r

s=n*2*3
def solve(h):
	m=[[None]*(s/h) for _ in range(h)]
	return dfs(m,0,0,n)

r=0
i=1
while i*i<=s:
	if s%i==0:
		r+=solve(i)
		if i+i<s: r+=solve(s/i)
	i+=1
print(r)