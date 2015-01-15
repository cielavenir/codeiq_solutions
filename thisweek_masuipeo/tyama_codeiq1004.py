#Used this to solve checkio "Lantern Festival"

D=( #Right,Up,Left,Down
	(0,1),
	(-1,0),
	(0,-1),
	(1,0),
)

class Maze:
	def __init__(self,x,y,gx,gy,d,v):
		self.x=x
		self.y=y
		self.gx=gx
		self.gy=gy
		self.d=d
		self.v=v
	def ok(self):
		return self.gx==self.x and self.gy==self.y
	def same(self,other):
		return self.x==other.x and self.y==other.y
	def move(self):
		d_orig=(self.d+3)%4
		for i in range(4):
			self.d=(d_orig+i)%4
			if self.v[self.y+D[self.d][0]][self.x+D[self.d][1]]!='#': break
		self.y=self.y+D[self.d][0]
		self.x=self.x+D[self.d][1]
		#printf("%d %d %d\n"%(x,y,d))

def solvable(_x,_y,_gx,_gy,v):
	if v[_y][_x]=='#' or v[_gy][_gx]=='#': return False
	q=[]
	back={}
	q.append((_x,_y))
	back[(_x,_y)]=(_x,_y)
	while q:
		x,y=q[0]
		q.pop(0)
		for d in range(4):
			if v[y+D[d][0]][x+D[d][1]]!='#':
				_p=(x+D[d][1],y+D[d][0])
				if _p==(_gx,_gy): return True
				if _p not in back:
					back[_p]=(x,y)
					q.append(_p)
	return False

if __name__=='__main__':
	N=4
	power=N*N
	v=[]
	v.append(['#']*(N+2))
	for i in range(N):
		v.append(['#']+[' ']*N+['#'])
	v.append(['#']*(N+2))
	#v=[
	#	list("######"),
	#	list("#    #"),
	#	list("##   #"),
	#	list("# #  #"),
	#	list("#    #"),
	#	list("######"),
	#]
	r=0
	for i in range(1<<power):
		for j in range(power):
			v[j/N+1][j%N+1]='#' if (i&(1<<j)) else ' '
		if not solvable(1,1,N,N,v): continue
		m1=Maze(1,1,N,N,3,v)
		m2=Maze(N,N,1,1,1,v)
		while not m1.ok() and not m2.ok():
			m1.move()
			m2.move()
			if m1.same(m2):
				r+=1
				break
	print(r)