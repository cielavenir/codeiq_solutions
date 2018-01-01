#!/usr/bin/ruby
def f(n,k)
	#最大がk以下になるn個の数字の置き方
	k**n
end

m,n=gets.split.map &:to_i
r=0
[*1...m].combination(n-1).each{|a|
	#最大がちょうどnになるm個の数字の置き方
	#m個の領域からn箇所総当たりで選ぶ(実際には0を固定)。mは番兵
	a=[0]+a+[m]
	z=1
	a.each_cons(2).with_index{|(x,y),i|
		z*=f(y-x-1,i)
	}
	r+=z
}
p r

__END__
計算量見積もり、nCkは(2項定理より)2**nより小さいことに気付かないときついか。
