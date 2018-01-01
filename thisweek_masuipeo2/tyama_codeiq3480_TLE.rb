#!/usr/bin/env ruby
require 'prime'
def chk(m,n,r)
	s=2+r
	(n-1).times{
		i=(s..1/0.0).find{|i|i.prime?}
		return false if i>m
		s=i+r
	}
	true
end
m,n=gets.split.map &:to_i
p (1..2*m/n).bsearch{|i|!chk(m,n,i)}-1
