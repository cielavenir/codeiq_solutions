#!/usr/bin/env ruby
n=gets.to_f
q=1
r=0
(1..1/Math.tan(n)).each{|q| # Rational(1,q)>=Math.tan(n)
	(q+1..1/0.0).each{|a|
		b=Rational(q*a+1,a-q)
		break if a>=b
		r+=1 if b==b.to_i
	}
}
p r
__END__
tan(α+β)=(tanα+tanβ)/(1-tanαtanβ)
1/q=((a+b)/ab)/((ab-1)/ab)=(a+b)/(ab-1)
b=(qa+1)/(a-q)
