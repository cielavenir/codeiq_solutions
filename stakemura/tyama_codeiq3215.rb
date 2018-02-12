#!/usr/bin/ruby
while gets
	r={}
	$_.split[1].split(',').each{|e|
		range,int=e.split('/')
		st,en=range.split('-')
		if st=='*'
			st,en=0,23
		else
			st=st.to_i
			en=en ? en.to_i : st
		end
		int=int ? int.to_i : 1
		next if st>en
		st.step(en,int){|i|r[i]=1}
	}
	puts r.keys.sort*' '
end
