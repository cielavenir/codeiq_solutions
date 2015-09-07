#!/usr/bin/ruby
def solve(n)
	ret=0
	below=n/2
	ma=10**below
	sq={}
	(0...ma).each{|e|sq[e*e]=e}
	(ma/10...ma).each{|a|#a=上位,x=下位
		#a**2+x**2==a*ma+x <=> x**2-x+a**2-a*ma==0
		#x=(1+sqrt(1-4*(a**2-a*ma)))/2
		n=1-4*(a**2-a*ma)
		next if !sq.has_key?(n)
		x=(1+sq[n])/2
		ret+=a*ma+x
	}
	ret
end

p solve(4)
p solve(6)
p solve(10)

__END__
【解答】
・第１問：990100
・第２問：29901173703
【方針】
aを上位n/2桁、xを下位n/2桁とすると、各aに対応するxは、
a**2+x**2==a*ma+x <=> x**2-x+a**2-a*ma==0
x=(1+sqrt(1-4*(a**2-a*ma)))/2
となる。
平方根は10**(n/2)まであらかじめ保存しておくことで誤差をなくすことができる。
平方根が整数にならない(a,x)の組み合わせは条件を満たさない。
【言語】
Ruby
【コード】