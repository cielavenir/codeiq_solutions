#!/usr/bin/ruby
1.step(1100){|n|
	a=[*1..n]
	while a.size>1
		a=a.select.with_index{|e,i|i%2==0}.reverse
	end
	puts sprintf('%08b',n-1)+' '+a[0].to_s
}