#!/usr/bin/ruby
#coding:utf-8
SQ={}
(2..10000).each{|i|SQ[i*i]=1}
def dfs(n,a)
	if n==1
		x=0
		a.size.times{|i|
			y=1
			i.upto(a.size-1){|j|
				y*=a[j]
				x+=1 if SQ[y]
			}
		}
		return x==1 ? 1 : 0
	end
	r=0
	[2,3,5,6,7,8].each{|i|
		next if n%i>0||SQ[n/i]
		a<<i
		r+=dfs(n/i,a)
		a.pop
	}
	r
end

N=gets.to_i
p N==0||N==1 ? 1 : N==4||N==9 ? 2 : dfs(N,[])