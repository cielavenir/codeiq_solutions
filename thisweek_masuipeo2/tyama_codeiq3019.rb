#!/usr/bin/ruby
$memo={}
def dfs(total,n,turn,get)
	$memo[[turn,*get]]||=(1..[n,total].min).reduce(0){|r,i|
		get[turn]+=i;total-=i
		if total==0
			r+=1 if turn==0&&get[0]>get[1]
		else
			r+=dfs(total,n,turn^1,get)
		end
		get[turn]-=i;total+=i
		r
	}
end
a,b=gets.split.map(&:to_i)
p dfs(a,b,0,[0,0])
