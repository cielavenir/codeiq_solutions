#!/usr/bin/ruby
$memoF={}
$memoG={}
def f2(n,k)
	return 0 if n<0
	return 1 if n==0
	$memoF[[n,k]]||=(1..k).reduce(0){|s,i|s+f2(n-i,i)}
end
def f(n,k)
	f2(n-k,k)
end
def g2(m,n,k)
	return 0 if n<0
	if k==0
		return n==0 ? 1 : 0
	end
	$memoG[[m,n,k]]||=(1..m).reduce(0){|s,i|s+g2(i,n-i,k-1)}
end
def g(n,k)
	(1..n).reduce(0){|s,m0|s+g2(m0,n-m0,k-1)}
end
n,k=gets.split.map &:to_i
p f(n,k)*2 # +g(n,k)
#え？これで通るってマジなんですか？すごい…
