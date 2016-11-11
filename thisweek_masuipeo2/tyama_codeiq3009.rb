#!/usr/bin/ruby
D=[[-1,0],[0,-1],[1,0],[0,1]]
def comb(n,k)
	r=1
	k.times{|i|
		r=r*(n-i)/(i+1)
	}
	r
end
def dfs(x,y,last,lst,dnxt)
	return 0 if lst.include?(last)
	return 1 if x==0&&y==0
	return 0 if y==0
	r=0
	dnxt.each{|d|
		nxt=[last[0]+D[d][0],last[1]+D[d][1]]
		lst.push(last)
		if x>0
			r+=dfs(x-1,y,nxt,lst,[d])
		end
		if y>0
			r+=dfs(x,y-1,nxt,lst,[(d+1)%4,(d-1)%4])
		end
		lst.pop
	}
	r
end
x,y=gets.split.map(&:to_i)
#点字ブロックはマスの中央にしか置けない(問題文からは読み取れなくないですか)ため、通常ブロックの枚数を変更する
x-=y-1
if x<0 || x%2==1
	p 0;exit
end
x/=2

#ループを考えなければこれでよいのだが…
#p 2**y * comb(x+y-2,x)

p dfs(x,y-1,[0,0],[],[0])*4
