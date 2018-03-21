#!/usr/bin/ruby
#A032563
p Enumerator.new{|y|
	(1..1/0.0).each{|i|
		y<<p(i) if i.to_s.hex%i==0
	}
}.take(gets.to_i).last