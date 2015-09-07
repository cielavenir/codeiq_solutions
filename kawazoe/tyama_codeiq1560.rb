#!/usr/bin/ruby
def solve(factor,ma)
	r=0
	(1..factor.size).each{|n|
		factor.combination(n){|a|
			divisor=a.reduce(:*)
			items=ma/divisor
			items_sum=items*(items+1)/2
			r+=(-1)**(~n%2) * items_sum*divisor
		}
	}
	r
end

factor=[3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
p solve(factor,1000)
p solve(factor,100000)
p solve(factor,1000000000)

__END__
【解答】
・第１問：3469796305
・第２問：347147851533059033
【方針】
M以下の正の整数のうち、Xの倍数であるものの総和は、
items=M/X(切り捨て)とすると、items*(items+1)/2*Xで求められる。
和集合については包除原理を用いた。
【言語】
Ruby
【コード】
@paiza_run m=10**9;r=0;(1..10).each{|n|[3,5,7,11,13,17,19,23,29,31].combination(n){|a|r+=(1-n%2*2)*((q=m/d=a.reduce(:*))*~q/2*d)}};p r
#「(-1)**(~n%2)」は「(n%2*2-1)」に、「items*(items+1)/2」は「-items*~items/2」に置き換えられる。