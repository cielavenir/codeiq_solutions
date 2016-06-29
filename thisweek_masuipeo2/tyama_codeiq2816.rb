#!/usr/bin/env ruby
def enum(base)
	return to_enum(:enum,base) if !block_given?
	(base..base**base).each{|i|
		s=i.to_s(base)
		yield s if i==s.bytes.reduce(0){|x,b|x+(b-48)**s.size}
	}
end
n=gets.to_i;puts enum(n).take(n)