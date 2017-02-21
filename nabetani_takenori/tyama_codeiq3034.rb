#!/usr/bin/ruby
#coding:utf-8

AddSub = Regexp.compile(/^(.*?)([0-9,-]+)([+Z])([0-9,-]+)$/)
MulDiv = Regexp.compile(/^(.*?)([0-9,-]+)([*])([0-9,-]+)$/)

def process(s)
	#analyze parens
	bidx=s.index("(")
	while bidx
		count=1
		eidx=bidx+1
		while count!=0
			count+=1 if s[eidx,1]=='('
			count-=1 if s[eidx,1]==')'
			eidx+=1
		end
		s=s[0,bidx]+process(s[bidx+1...eidx-1])+s[eidx..-1]
		bidx=s.index("(")
	end

	while m=MulDiv.match(s)
		if m[3]=='*'
			m[1]+(m[2].to_i*m[4].to_i).to_s
		end
	end

	while m=AddSub.match(s)
		if m[3]=='+'
			s=m[1]+(m[2].to_i+m[4].to_i).to_s
		else
			s=m[1]+(m[2].to_i-m[4].to_i).to_s
		end
	end
	s
end

puts process(gets.chomp.gsub('-','Z'))
