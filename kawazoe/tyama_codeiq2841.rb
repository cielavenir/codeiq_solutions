#!/usr/bin/ruby
M=10**6
k=gets.to_i-1
if false
	a=b=d=e=f=1;c=0
	k.times{
		a,b,c,d,e,f=(a+b+c+d+e+f)%M,(a+c+d)%M,a,(a+b+c)%M,a,(b+d)%M
	}
	p (a+b+c+d+e)%M
else
	def mul(a,b)
		r=a.size.times.map{[0]*b[0].size}
		a.size.times{|y|
			b[0].size.times{|x|
				r[y][x]=b.size.times.reduce(0){|s,i|(s+a[y][i]*b[i][x])%M}
			}
		}
		r
	end
		
	a=[[1,1,1,1,1,1],[1,0,1,1,0,0],[1,0,0,0,0,0],[1,1,1,0,0,0],[1,0,0,0,0,0],[0,1,0,1,0,0]]
	e=6.times.map{|i|[0]*i+[1]+[0]*(6-i-1)}
	while k>0
		e=mul(e,a) if k%2>0
		a=mul(a,a)
		k/=2
	end
	b=mul(e,[[1,1,0,1,1,1]].transpose).transpose[0]
	p (b[0]+b[1]+b[2]+b[3]+b[4])%M
end

__END__
brute force solution from 1094:
4 11 39 121 387 1237 3955 12637 40387 129069 412483

a=000
b=100
c=010
d=001
e=101
f=010 (will be saved if next is 000)
