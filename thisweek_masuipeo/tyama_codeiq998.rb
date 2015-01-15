#!/usr/bin/ruby
BASE=16

def convert(str)
	ret=''
	prev=0
	str.size.times{|j|
		cur=str[j].to_i(BASE)
		d=(cur-prev+BASE)%BASE
		ret+=d.to_s(BASE)
		prev=cur
	}
	ret
end

def solve(s)
	n=0
	cur=s
	begin
		cur=convert(cur)
		n+=1
	end while cur!=s
	n
end

#p solve('100')
p solve('808080')
p solve('abcdef')