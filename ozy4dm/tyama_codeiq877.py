D={3:5,5:13}
def grid(m,I,J):
	f=True
	s=0
	for j in range(M):
		if m[I][j]: s+=m[I][j]
		else: f=False
	if f and s!=S: return False
	f=True
	s=0
	for i in range(M):
		if m[i][J]: s+=m[i][J]
		else: f=False
	if f and s!=S: return False
	return True

def dfs(m,h,n):
	if n==M*M:
		#check diagonal
		if sum(m[i][i] for i in range(M))!=S: return None
		if sum(m[i][M-i-1] for i in range(M))!=S: return None
		return m
	i=n//M
	j=n%M
	if m[i][j]: return dfs(m,h,n+1)
	for k in range(1-D[M],M*M+1-D[M]):
		if k not in h:
			m[i][j]=k
			if grid(m,i,j):
				h[k]=1
				if dfs(m,h,n+1): return m
				del h[k]
	m[i][j]=None
	return None

def checkio(data):
	global M,S
	M=len(data)
	S=0 #M*(M*M+1)//2
	h={}
	for y in range(len(data)):
		for x in range(len(data[0])):
			h[data[y][x]]=1
	return dfs(data,h,0)

if __name__ == '__main__':
	for e in checkio([[None]*3 for e in range(3)]): print(' '.join(str(f) for f in e))
	#for e in checkio([[0,1,2,-3],[None,None,None,None],[None,None,None,None],[None,None,None,None]]): print(' '.join(map(str,e)))
	#https://github.com/Bryukh-Checkio-Tasks/checkio-task-magic-square/blob/master/editor/animation/init.js#L109
	for e in checkio([[None,-6,None,3,None],[-2,None,10,None,-4],[None,-9,None,2,None],[-3,None,4,None,-12],[None,8,None,-5,None]]): print(' '.join(str(f) for f in e))