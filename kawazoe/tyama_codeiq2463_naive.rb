#!/usr/bin/ruby
L=gets.to_i
r=0
1.upto(L){|b|
	1.upto(b){|a|
		c=Math.hypot(a,b)
		next if c!=c.to_i
		s=(a+b+c)/2
		x = c*s / Math.sqrt(s*(s-a)*(s-b)*(s-c)) / 2
		if (a*x-(a*x+1e-5).to_i).abs<1e-9 and (b*x-(b*x+1e-5).to_i).abs<1e-9
			r+=1
			p [a/a.gcd(b),b/b.gcd(a),a,b]
		end
	}
}
p r

__END__
c=hypot(a,b)
s=(ax+bx+cx)/2
Math.sqrt(s*(s-ax)*(s-bx)*(s-cx))/s * 2 == c