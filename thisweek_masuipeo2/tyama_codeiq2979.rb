#!/usr/bin/ruby
#coding:utf-8

def comb(n,r)
	return 0 if r<0||n<r
	ret=1
	if r>n/2 then r=n-r end
	r.times{|i|
		ret=ret*(n-i)/(i+1)
	}
	ret
end

$memo={}
def g(m,n)
	return 1 if n==0&&m==1
	return 0 if n==0||m==1
	$memo[[m,n]]||=(comb(m-3+3-1,m-3)+3)*g(m,n-1)+3*(1...m).reduce(0){|s,i|s+g(i,n-1)}
end

m,n=gets.split.map(&:to_i)
p g(m,n)