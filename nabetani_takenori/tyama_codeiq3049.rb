#!/usr/bin/env ruby
#1000以下なら総当りでいいよね
D=[[0,-1],[-1,0],[0,1],[1,0]]
cur=[0,0,0]
mapping={}
trail=Hash.new{|h,k|h[k]=[]}
trail[mapping[cur[0,2]]]=[]
mapping[cur[0,2]]=1
2.upto(1500){|i|
	x,y,d=cur
	1.downto(-2){|j|
		nxt=[x+D[(d+j)%4][0],y+D[(d+j)%4][1],(d+j)%4]
		f=mapping.has_key?(nxt[0,2])
		mapping[nxt[0,2]]=i if !f
		trail[mapping[nxt[0,2]]]<<mapping[cur[0,2]]
		trail[mapping[cur[0,2]]]<<mapping[nxt[0,2]]
		(cur=nxt;break) if !f
	}
}
puts trail[gets.to_i].sort*','
