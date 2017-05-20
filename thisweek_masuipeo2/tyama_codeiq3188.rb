#!/usr/bin/env ruby
m,n=gets.split.map(&:to_i)
p 0.step(n-m>>1).count{|z|
	#O(1)でできそうな気がするけどどうなんでしょうね…
	y=n-m-2*z
	x=m-z-y
	y>=0&&x>=0
}

__END__
x+y+z=m
x+2y+3z=n
=> y+2z==n-m
