#!/usr/bin/env ruby
b=[];x=0;10.times{|i|b<<(x+=31+0b01001010100[i])}
firstday=b[0]
(1..1/0.0).each{|d|
	STDERR.puts '[*] %d'%d
	(1..6).each{|st|
		m=1
		m+=1 while m*st/d<firstday
		while m*st/d<firstday+200
			diff=m*st/d-firstday
			a=b.size.times.map{|i|(m*(st+i)/d-diff)}
			if a==b
				p [m,st,d,diff] # [220, 1, 7, 0]
				exit
			end
			m+=1
		end
	}
}