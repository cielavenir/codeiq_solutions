#!/usr/bin/env ruby
b=[];x=0;10.times{|i|b<<(x+=31+0b00100010010[i])} # 最上位=E月
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
				p a
				p [m,st,d,diff] # [219, 3, 7, 62]
				exit
			end
			m+=1
		end
	}
}