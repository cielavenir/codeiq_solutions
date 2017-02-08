#!/usr/bin/python
import sys,heapq
if sys.version_info[0]<3:
	input=raw_input
	range=xrange
INF=1<<30

def shortestPath(g,s,dist,prev):
	n = len(g)
	dist[s] = 0
	Q=[]
	heapq.heappush(Q,(0,-2,s))
	while Q:
		e=heapq.heappop(Q)
		if prev[e[2]]!=-1: continue
		prev[e[2]]=e[1]
		for f in g[e[2]]:
			if dist[f[2]]>e[0]+f[0]:
				dist[f[2]]=e[0]+f[0]
				heapq.heappush(Q,(e[0]+f[0],f[1],f[2]))

M=[[0]*20 for _ in range(20)]
def shortestHamiltonCycle(n):
	N=1<<n
	best=[[0]*n for _ in range(N)]
	for S in range(N):
		for i in range(n): best[S][i]=INF
	best[0][0]=0
	for S in range(N):
		for j in range(n):
			if not S&(1<<j):
				for i in range(n):
					if best[S|(1<<j)][j] > best[S][i] + M[i][j]:
						best[S|(1<<j)][j] = best[S][i] + M[i][j]
	return -1 if best[N-1][0]==INF else best[N-1][0]

maxc=0
H,W=map(int,input().split())
v=[]
for i in range(H):
	v.append(list(map(int,input().strip())))
	for c in v[i]: maxc=max(maxc,c)
max_area=[0]
g=[[] for _ in range(H*W)]
for i in range(H):
	for j in range(W):
		x=i*W+j
		if v[i][j]==maxc: max_area.append(x)
		if i<H-1:
			y=(i+1)*W+j
			f=v[i][j]-v[i+1][j]
			if f==-1: g[x].append((11,x,y));g[y].append((2,y,x))
			if f==1: g[x].append((2,x,y));g[y].append((11,y,x))
			if f==0: g[x].append((3,x,y));g[y].append((3,y,x))
		if j<W-1:
			y=i*W+j+1
			f=v[i][j]-v[i][j+1]
			if f==-1: g[x].append((11,x,y));g[y].append((2,y,x))
			if f==1: g[x].append((2,x,y));g[y].append((11,y,x))
			if f==0: g[x].append((3,x,y));g[y].append((3,y,x))
N=len(max_area)
for i in range(N):
	dist=[INF]*len(g)
	prev=[-1]*len(g)
	shortestPath(g,max_area[i],dist,prev)
	for j in range(N): M[i][j]=dist[max_area[j]]
print(shortestHamiltonCycle(N))
