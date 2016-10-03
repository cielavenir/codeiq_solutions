#!/usr/bin/ruby
m,n=gets.split(',').map(&:to_i)
puts (m-1).downto(2).find{|i|
	a=i.to_s.chars.to_a
	b=(i**n).to_s.chars.to_a
	a==a.uniq && b-a==b
}||:-