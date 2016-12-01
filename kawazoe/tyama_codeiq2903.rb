#!/usr/bin/ruby
def pow(x,y,m)
	z = 1
	while y!=0
		z=z*x%m if y&1!=0
		x=x*x%m
		y>>=1
	end
	z
end

require 'prime'
require 'set'
M=1000003
N=gets.to_i
if false
	h=Hash.new(0)
	2.upto(N){|i|i.prime_division.each{|k,v|h[k]+=v*N}}
	p h.reduce(1){|s,(n,p)|s*(pow(n,p+1,M)-1)*pow(n-1,M-2,M)%M}
	# ちゃんと逆元使うようにすればN<=30000ぐらいは1秒で計算できるようです
else
	z=1
	#pri=Set.new(Prime.each(N).to_a)
	p Prime.each(N).reduce(1){|s,n|
		#next s if !pri.include?(n)
		i=N
		p=0
		while i>0
			p+=i/=n
		end
		p*=N
		z=z*(n-1)%M
		s*(pow(n,p+1,M)-1)%M
	}*pow(z,M-2,M)%M
	# N!の末尾の0の個数の考えを使ったら810000まで計算できました…
end
