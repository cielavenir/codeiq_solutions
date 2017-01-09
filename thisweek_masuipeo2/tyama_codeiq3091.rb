#!/usr/bin/env ruby
def catalan(n)
	(n+2..2*n).reduce(1,:*)/(1..n).reduce(1,:*)
end
def a001787(n)
	if true
		n<<(n-1)
	else
		r=0
		(0..(1<<(n+1))-1).each{|i|
			k=0
			(n+1).times{|j|
				if i[j]==0
					k=1
				else
					r+=k
					k=0
				end
			}
		}
		r
	end
end
n=gets.to_i-1
p a001787(n-1)*catalan(n)
# 演算子が入る場所はn-1箇所なのでCatalan(n-1)
# そのそれぞれに対し、+から*に切り替わる回数分だけ括弧が必要。
# その「回数」も実はO(1)で求まるので、実はn<=20000でも余裕だったりする。
