#!/usr/bin/ruby
r=0
m,n=gets.split.map(&:to_i)
a=[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47].take_while{|e|e<=m}
if false
	(2**a.size).times{|i|
		b=a.select.with_index{|e,j|i[j]==1}
		(2**b.size).times{|j|
			x=0
			b.each_with_index{|e,k|x+=e*(j[k]*2-1)}
			r+=1 if x==n
		}
	}
else
	(3**a.size).times{|i|
		x=y=0
		a.size.times{|j|
			x+=a[j] if i%3==0
			y+=a[j] if i%3==2
			i/=3
		}
		r+=1 if (x-y).abs==n
	}
	r/=2
end
p r

# RubyはTLEですが、2936と違ってcombination列挙が不要なので、Cでいけそうですね。