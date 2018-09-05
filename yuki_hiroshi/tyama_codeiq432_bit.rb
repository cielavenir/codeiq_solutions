#!/usr/bin/ruby
W=[0]*10**6
def bit(a,n)
	r=0
	i=n-1
	while i>=0
		idx=a[i]-1;(r+=W[idx];idx&=idx-1)while idx>0
		idx=a[i];(W[idx]+=1;idx+=idx&-idx)while idx<n
		i-=1
	end
	r
end
a=$<.map(&:to_i)
p bit(a,a.size)
