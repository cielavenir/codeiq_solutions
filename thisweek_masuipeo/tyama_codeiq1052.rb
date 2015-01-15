#!/usr/bin/ruby
#coding:utf-8
N=10
A=[1,2,3,4]
m=[[1]]
1.upto(N-1){|i|
	A.each{|e|
		if i-e>=0
			m[i]||=[0]*A.min
			m[i-e].size.times{|j|
				m[i][j+1]||=0
				m[i][j+1]+=m[i-e][j]
			}
		end
	}
}
#p m
r=0
1.step(N-1){|i|
	j=N-i
	k=0
	while m[i][k]&&m[j][k]
		r+=m[i][k]*m[j][k]
		k+=1
	end
}
p r