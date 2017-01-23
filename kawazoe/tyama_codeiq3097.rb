#!/usr/bin/env ruby
M=10
Mmore=Mless=M*(M-1)/2
Meq=M

n,c=gets.split.map &:to_i
ret=0
[*0...n].combination(c){|_|
	a=[0]*n
	_.each{|e|a[e]=1}
	b=a.chunk{|e|e}.map{|k,v|[k,v.size]}
	r=1
	b.each_with_index{|(k,v),i|
		if k==1
			r*=(Mmore+Meq)**(v-1)*Mmore
		elsif i==b.size-1
			r*=(Mless+Meq)**v
		else
			r*=(Mless+Meq)**(v-1)*Mless
		end
	}
	ret+=r
}
p ret
__END__
繰り上がる桁を列挙し、それぞれに対し組み合わせを計算
計算量はO(n 2^n)
