#!/usr/bin/ruby
require 'matrix'
N=-~gets.to_i/2*2-1 # 奇数の最大
N2=N+1>>1 # 和の最大の平方根

# 最大がN2を越えないピタゴラス数の列挙
P=Matrix[*[[-1,-2,2],[-2,-1,2],[-2,-2,3]].transpose]
Q=[Vector[3,4,5]]
r=N2 # n==0を例外扱い
while !Q.empty?
	c=Q.pop
	r+=N2/c[-1]*2
	m=Matrix[*[[-1,1,1],[1,-1,1],[-1,-1,1]].map{|e|c.zip(e).map{|x,y|x*y}}]
	(m*P).row_vectors.each{|e|Q<<e if e[-1]<=N2}
end
p r
# 10000000 => 27368012
