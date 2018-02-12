#!/usr/bin/ruby
require 'prime'
require 'bigdecimal'
a,b=gets.split('/').map &:to_i
g=a.gcd(b)
a/=g;b/=g
if a%b==0
	p a/b
else
	q=b.prime_division
	if q.all?{|n,p|[2,5].include?(n)}
		puts (BigDecimal(a)/b).to_s('f') # 手抜き
	else
		puts '%d/%d'%[a,b]
	end
end
