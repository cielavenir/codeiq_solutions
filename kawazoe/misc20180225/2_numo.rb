#!/usr/bin/ruby
require 'numo/narray'
N=-~gets.to_i/2*2-1 # 奇数の最大
N2=N+1>>1 # 和の最大の平方根

# 最大がN2を越えないピタゴラス数の列挙
P=Numo::Int32[*[[-1,-2,2],[-2,-1,2],[-2,-2,3]].transpose]
B=Numo::Int32[[-1,1,1],[1,-1,1],[-1,-1,1]]
Q=[Numo::Int32[3,4,5]]
r=N2 # n==0を例外扱い
while !Q.empty?
	c=Q.pop
	r+=N2/c[-1]*2
	m=(c.inplace*B).dot(P)
	3.times{|i|Q<<m[i,true] if m[i,-1]<=N2}
end
p r
# 10000000 => 27368012
