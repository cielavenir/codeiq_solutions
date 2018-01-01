#!/usr/bin/ruby
n=gets.to_i+1
s=n.to_s(2)
a=s.chars.chunk{|e|e}.map{|k,v|v*''}
if a.size==1
	puts a[0].to_i(2)
else
	idx=(1...a.size).find{|i|
		a[i-1].size>=a[i].size
	}
	if !idx
		puts a.join.to_i(2)
	else
		k=a[0,idx].join.size
		q=(1...s.size-k).find{|i|
			t=s[0,k]+'1'*i+'0'*(s.size-k-i)
			b=t.chars.chunk{|e|e}.map{|k,v|v*''}
			(1...b.size).none?{|i|
				b[i-1].size>=b[i].size
			}
		}||(s.size-k)
		t=s[0,k]+'1'*q+'0'*(s.size-k-q)
		b=t.chars.chunk{|e|e}.map{|k,v|v*''}
		if (1...b.size).none?{|i|
			b[i-1].size>=b[i].size
		}
			puts t.to_i(2)
		else
			idx=(s.size-1).downto(1).find{|i|
				t=s[0,i]+'1'*(s.size-i)
				b=t.chars.chunk{|e|e}.map{|k,v|v*''}
				(1...b.size).none?{|i|
					b[i-1].size>=b[i].size
				}
			}
			if s[idx-1]=='0'
				puts (s[0,idx]+'1'*(s.size-idx)).to_i(2)
			else
				puts (s[0,idx]+'1'+'0'*(s.size-idx-1)).to_i(2)
			end
		end
	end
end
__END__
この問題、ひたすらきついですねToT
