#!/usr/bin/ruby
def check(a,b)
	c=(Math.hypot(a,b)+1e-9).to_i
	s=a+b+c
	v=Math.sqrt(s*(s-2*a)*(s-2*b)*(s-2*c))
	raise if (v+1e-9).to_i!=v
	x=Rational(c*s,(v+1e-9).to_i)
	x.denominator
end

L=gets.to_i
r=0
(2..1/0.0).each{|m|
	n=1-m%2
	while n<m
		if m.gcd(n)==1
			a,b=[m*m-n*n,2*m*n].sort
			if den=check(a,b)
				r+=L/(b*den)
			end
		end
		n+=2
	end
	break if m>500
}
p r

__END__
【コードの説明】
まず、この三角形は直角三角形であるから、斜辺の長さが外接円の直径である。
よって、相似比をxとすると、(外側から見た)内接円の半径の公式より、
c=hypot(a,b)
s=(ax+bx+cx)/2
sqrt(s*(s-ax)*(s-bx)*(s-cx))/s * 2 == c
となればよいことがわかる。
xを括りだして、以下のように式変形する。
c=Math.hypot(a,b)
s=(a+b+c)
x = c*s / Math.sqrt(s*(s-a)*(s-b)*(s-c))
このとき、a*xとb*xがともに整数ならば条件をみたすことになる。

原始ピタゴラス数を求め、それぞれに対しxの分母を(適当に)求める。
あとは、2数の内大きい方に(xの分母)倍したものをLから割ればよい。
【言語】
Ruby
【コード】