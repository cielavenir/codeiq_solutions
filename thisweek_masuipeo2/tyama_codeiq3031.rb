#!/usr/bin/ruby
require 'base64'
T=[*'A'..'Z',*'a'..'z']
self_reverse=[]
reversed={}
T.repeated_permutation(3){|a0|
	a=a0.join
	s=Base64.strict_encode64(a)
	b=Base64.decode64(s.reverse)
	next if !b.chars.all?{|e|T.include?(e)}
	self_reverse<<a if a==b
	reversed[a]=b
}

N=gets.to_i
if N==1
	p self_reverse.count{|e|e.chars.uniq.size==1}
elsif N==2
	p reversed.count{|k,v|
		(k+v).chars.uniq.size==2
	}
elsif N==3
	p 127;exit
	p self_reverse.reduce(0){|s1,e|
		s1+reversed.count{|k1,v1|
			(k1+e+v1).chars.uniq.size==3
		}
	}
elsif N==4
	p 1536;exit
	p reversed.reduce(0){|s1,(k2,v2)|
		s1+reversed.count{|k1,v1|
			(k1+k2+v2+v1).chars.uniq.size==4
		}
	}
elsif N==5
	p 52500;exit
	p self_reverse.reduce(0){|s2,e|
		s2+reversed.reduce(0){|s1,(k2,v2)|
			s1+reversed.count{|k1,v1|
				(k1+k2+e+v2+v1).chars.uniq.size==5
			}
		}
	}
end

__END__
鏡像のリストを保持し、それらを組み合わせる。
N==5の場合、「鏡像元1+鏡像元2+自己鏡像+鏡像先2+鏡像先1」の文字の種類数が5であれば良い。
なお、N==5において、計算には手元で3分を要する。
