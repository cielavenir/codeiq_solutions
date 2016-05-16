#!/usr/bin/env ruby
class Array
	def each_cons_cyclic(n=self.size,k=0,cnt=self.size)
		return to_enum(:each_cons_cyclic,n,k,cnt) if !block_given?
		cnt.times{|i|
			yield self.rotate(i+k)[0,n]
		}
	end
end
	
def solve(a)
	n=0
	a.size.times{|i|
		0.upto(a[i].size-3){|j|
			(j+2).upto(a[i].size-1){|k|
				c,d,e,f=a[i][j],a[i][j+1],a[i][k],a[i][(k+1)%a[i].size]
				next if c==f
		#a[i].each_cons_cyclic(2,0,a[i].size-2).each_with_index{|(c,d),j|
			#a[i].each_cons_cyclic(2,j+2,a[i].size-j-(j==0 ? 3 : 2)){|(e,f)|
				e_inside=(c<e&&e<d) ^ (d<e&&e<c)
				f_inside=(c<f&&f<d) ^ (d<f&&f<c)
				n+=1 if e_inside^f_inside
			}
		}
	}
	n
end

N=gets.to_i
r=0
[*0...N].permutation{|a|
	f=[false]*N
	b=[]
	N.times{|i|
		next if f[i]
		cur=i
		c=[]
		begin
			c<<cur
			f[cur]=true
			cur=a[cur]
		end while cur!=i
		b<<c
	}
	next if b.any?{|e|e.size<3} || b.size>1
	r+=solve(b)
}
p r