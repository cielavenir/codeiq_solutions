#!/usr/bin/ruby
puts [*0..9].permutation.select{|a|
	n=a.join.to_i
	a.all?{|e|e==0||n%e==0} && a.each_cons(2).all?{|x,y|n%(x*10+y)==0}
}.map{|e|e*''}