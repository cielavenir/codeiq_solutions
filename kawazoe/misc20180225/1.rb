#!/usr/bin/ruby
W,H,M=gets.split.map &:to_i
A=(H+1).times.map{(W+1).times.map{Hash.new 0}}
A[0][0][0]=1
(H+1).times{|h|(W+1).times{|w|
	if h>0
		A[h-1][w].each{|k,v|A[h][w][k+(w==M-1 ? 1 : 0)]+=v}
	end
	if w>0
		A[h][w-1].each{|k,v|A[h][w][k]+=v}
	end
}}
r0=r1=0
A[H][W].each{|k,v|r0+=k*v;r1+=v}
p (r0*1.0/r1).round(7)
#制約が小さいので愚直解でも通りそう
# 10 10 3 => 0.9090909
