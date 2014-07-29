#!/usr/bin/python
def entry_point(argv):
	#print(__name__)
	N=7777777
	t=[False]*N
	p=[i for i in range(N)]
	for i in range(2,N):
		if not t[i]:
			for j in range(i,N,i):
				t[j]=True
				p[j]-=p[j]//i
	for i in range(1,N):p[i]+=p[i-1]
	print(p[N-1]*2+1)
	return 0

def target(*args):
	return entry_point

if __name__ == '__main__': entry_point([])