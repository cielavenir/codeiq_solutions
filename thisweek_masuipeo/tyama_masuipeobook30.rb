#!/usr/bin/env ruby
$memo={}
def dfs(n)
	raise if n<=0
	return 1 if n==1
	$memo[n]||=lambda{
		r=0
		#2個の場合
		i=1
		while i+i<n
			r+=dfs(i)*dfs(n-i) / (i==n-i ? 2 : 1)
			i+=1
		end
		if n%2==0
			#左右が同じ + 左右が違う/2
			#r+=dfs(n/2) + dfs(n/2)*(dfs(n/2)-1)/2;
			#くくり出し
			r+=dfs(n/2)*(dfs(n/2)+1)/2;
		end
		#3個の場合
		i=1
		while i+i+i<n
			r+=dfs(n-i-i)*dfs(i)*(dfs(i)+1)/2;
			j=i+1
			while i+j+j<n
				r+=dfs(i)*dfs(j)*dfs(n-i-j)
				j+=1
			end
			if (n-i)%2==0
				r+=dfs(i)*dfs((n-i)/2)*(dfs((n-i)/2)+1)/2;
			end
			i+=1
		end
		if n%3==0
			r+=dfs(n/3)*(dfs(n/3)+1)*(dfs(n/3)+2)/6;
		end
		r
	}.call
end
p dfs(20)