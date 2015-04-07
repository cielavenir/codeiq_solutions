#!/usr/bin/ruby
p Enumerator.new{|y|
	taboo=[0,3,6,9]
	i=1
	loop{
		y<<i if taboo.all?{|e|!i.to_s.include?(e.to_s)}
		i+=1
	}
}.take(10000).last