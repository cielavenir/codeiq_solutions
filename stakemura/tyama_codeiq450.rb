#!/usr/bin/ruby
#while gets
s=$<.map(&:strip)
while s.size>1
    k=[0,-1,-1]
	s.size.times{|i|
		s.size.times{|j|
			if i!=j
				n=[s[i].size,s[j].size].min
				n-=1 while n>0&&s[i][-n..-1]!=s[j][0,n]
				k=[n,i,j] if n>k[0]
			end
		}
	}
	if k[0]==0 then
		s=[s.max_by(&:size)];break
	end
	s<<s[k[1]]+s[k[2]][k[0]..-1]
	s[k[1]]=s[k[2]]=nil
	s.select!{|e|e}
end
puts s[0]
#end