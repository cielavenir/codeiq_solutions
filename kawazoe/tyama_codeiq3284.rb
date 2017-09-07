#!/usr/bin/env ruby

def fac(n,m)
	r=1
	while n>1
		r=r*n%m
		n-=1
	end
	r
end
def pow_binary_mod(x,y,m)
	z = 1
	while y!=0
		z=z*x%m if y&1!=0
		x=x*x%m
		y>>=1
	end
	z
end
n,M=gets.split.map &:to_i
Z=M-1 # fac(M-1,M) # Mが素数ならばM-1に定まる
s=1
while n>0
	d,r=n.divmod(M)
	#律速はfac(r,M)であり、全体の計算量はO(logN+M)となる。
	#from https://twitter.com/g_m_k/status/905614899618787328
	x=[1,-1][d%2] #pow_binary_mod(Z,d,M)
	s=s*x*fac(r,M)%M
	n=d
end
p s
__END__
p (1..n).reduce(1){|s,i|d,r=i.divmod(M);s*(r!=0 ? r : (d/=M while d%M==0;d%M))%M}
