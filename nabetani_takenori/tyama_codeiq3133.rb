#!/usr/bin/env ruby
if $0==__FILE__
	while gets
		n=$_.to_i(16)
		a=b=c=d=0
		56.times.count{|i|
			a+=1 if n[i+8]==0&&n[i]==1
			b+=1 if n[i+8]==1&&n[i]==0
			c+=1 if n[i/7*8+i%7+1]==0&&n[i/7*8+i%7]==1
			d+=1 if n[i/7*8+i%7+1]==1&&n[i/7*8+i%7]==0
		}
		puts [a,b,c,d]*','
	end
end
