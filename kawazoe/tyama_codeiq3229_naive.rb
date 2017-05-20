#!/usr/bin/ruby
def comb(n,k)
	r=1
	k.times{|i|
		r=r*(n-i)/(i+1)
	}
	r
end

N,K=gets.split.map(&:to_i)
raise if N>4
r=0
(1..K).each{|k|
	r0=0
	[*0...N*N].combination(k){|a|
		b=[]
		a.each_with_index{|e,i|
			b[i]=true
			x,y=e.divmod N
			i.times{|j|
				x0,y0=a[j].divmod N
				if x==x0||y==y0
					b[i]=b[j]=false
				end
			}
		}
		r0+=b.count(true)
	}
	r+=r0.to_f/comb(N*N,k)*1000
}
p r.to_i
