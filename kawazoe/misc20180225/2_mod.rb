#!/usr/bin/ruby
require 'rational'
N=-~gets.to_i/2*2-1 # 奇数の最大
N2=N+1>>1 # 和の最大の平方根

# m*m+n*nがN2を越えないピタゴラス数の列挙

r=N2 # n==0を例外扱い
# mを自然数、nをm未満の自然数とするとき、ピタゴラス数は、
# m*m-n*n,2*m*n,m*m+n*n
# で列挙することができる(ただしこの3数は互いに素である必要がある)
(1..1/0.0).each{|m|
	break if m>N
	(1+m%2).step(m-1,2){|n|
		break if m*m+n*n>N2
		next if m.gcd(n)>1
		r+=N2/(m*m+n*n)*2
	}
}
p r
# 10000000 => 27368012
