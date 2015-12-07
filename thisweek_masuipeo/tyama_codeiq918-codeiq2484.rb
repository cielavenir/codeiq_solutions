#!/usr/bin/ruby
M,N=gets.split(',').map(&:to_i)
D=[[-1,0],[1,0],[0,-1],[0,1]]

A=N.times.map{[nil]*M}
def dfs(x,y,d)
	return 0 if x<0 || M<=x || y<0 || N<=y || A[y][x]
	if d==M*N
		return 1 #sx+sy*M<x+y*M ? 1 : 0
	end
	r=0
	A[y][x]=1
=begin
	#こっちだと5*6で28秒。やはり配列アクセスが遅い。
	D.each{|dir|
		r+=dfs(x+dir[0],y+dir[1],d+1)
	}
=end
	r+=dfs(x-1,y,d+1)
	r+=dfs(x+1,y,d+1)
	r+=dfs(x,y-1,d+1)
	r+=dfs(x,y+1,d+1)
	A[y][x]=nil
	return r
end
r=0
#先に半分にすることで、5*6でも18秒に。
(M*N/2).times{|i|
	r+=dfs(i%M,i/M,1)
}
r*=2
r+=dfs(M*N/2%M,M*N/2/M,1) if M*N%2==1
p r
# divide by 2 for 918