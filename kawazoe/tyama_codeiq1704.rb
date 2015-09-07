#!/usr/bin/ruby
#coding:utf-8
N=6
h=Hash.new(0)
(10**N).times{|i|
	cnt=Hash.new(0)
	n=i
	N.times{
		cnt[n%10]+=1
		n/=10
	}
	h[cnt.values.max]+=1
}
p h
numerator=h.values.reduce(:+)/10
R=h.reduce(0){|s,(k,v)|s+k*v}/10
puts '%d.%0*d'%[R/numerator,N-1,R%numerator]

__END__
2.01966