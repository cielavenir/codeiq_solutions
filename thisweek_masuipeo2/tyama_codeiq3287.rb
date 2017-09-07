#!/usr/bin/env ruby
require 'prime'
require 'set'
T=Set.new Prime.each(99999)
Memo={}
def dfs(n,m)
	return 1 if n==0
	return 0 if n==1
	Memo[[n,m]]||=(2..[m,n].min).reduce(0){|s,i|s+(T.include?(i) ? dfs(n-i,i) : 0)}
end
n=gets.to_i
p dfs(n,n)