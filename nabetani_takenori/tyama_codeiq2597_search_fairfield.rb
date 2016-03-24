#!/usr/bin/env ruby
b=[];x=0;11.times{|i|b<<(x+=30+0b011010110101[i])} # 最上位=2月
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
				p [m,st,d,diff] # [153, 5, 5, 122]
				exit
			end
			m+=1
		end
	}
}