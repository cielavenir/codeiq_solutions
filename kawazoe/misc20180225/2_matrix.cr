#!/usr/bin/env crystal
require "matrix"
_N=-~gets.not_nil!.to_i/2*2-1 # 奇数の最大
_N2=_N+1>>1 # 和の最大の平方根

# 最大がN2を越えないピタゴラス数の列挙
P=Matrix.rows([[-1,-2,2],[-2,-1,2],[-2,-2,3]].transpose)
Q=[Matrix.row(3,4,5)]
r=_N2 # n==0を例外扱い
while !Q.empty?
	c=Q.pop
	r+=_N2/c[-1]*2
	m=Matrix.rows([[-1,1,1],[1,-1,1],[-1,-1,1]].map{|e|e.zip(c.to_a).map{|x,y|x*y}})
	(m*P).row_vectors.each{|e|Q<<e if e[-1]<=_N2}
end
p r
# 10000000 => 27368012

