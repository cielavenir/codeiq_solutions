#!/usr/bin/ruby
$memo={}
def dfs(h,w,n,m)
	return m==0 ? 1 : 0 if n==0
	$memo[[h,w,n,m]]||=->{
		r=0
		(1...h).each{|h0|(1...w).each{|w0|
			next if h0*w0>m
			r+=dfs(h0,w0,n-1,m-h0*w0)
		}}
		r
	}.()
end
n,m=gets.split.map &:to_i
p dfs(m,m,n,m)
