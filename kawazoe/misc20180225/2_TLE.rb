#!/usr/bin/ruby
N=gets.to_i
r=0
1.upto(N){|n|
	#初項1 項数a+1/2 公差2
	#(a+1)/2 (2+(a-1))
	#(a+1)**2/4
	#(a+1)**2-(b+1)**2==4*n
	#(a-b)*(a+b+2)==4*n
	i=2*n
	m=4*n*n
	while i>0&&(a=(m/i-2+i)/2)<=N&&(b=a-i)>=-1
		if m%i==0 && (m/i-2+i)%2==0
			#a-b==i, a+b==n/i-2
			#a=(m/i-2+i)/2
			#b=(m/i-2-i)/2
			if a%2!=0&&b%2!=0
				r+=1
			end
		end
		i-=1
	end
}
p r
