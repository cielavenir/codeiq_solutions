#!/usr/bin/env ruby
$memo={}
def f(n,m,k)
	return 1 if n==0
	return 0 if k==0||m*k<n
	$memo[[n,m,k]]||=m.downto(1).reduce(0){|s,i|s+f(n-i,i,k-1)}
end
p f(gets.to_i,9,24)
