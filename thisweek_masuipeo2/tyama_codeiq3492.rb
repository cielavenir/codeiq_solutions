#!/usr/bin/ruby
$memo=[]
def dfs(n,m,s,d)
	if d==0
		$memo<<m
	else
		while m*s**d<=n
			dfs(n,m*s,s,d-1)
			s+=1
		end
	end
end
n=gets.to_i
dfs(n,1,1,3)
$memo.sort!
r=0
$memo.size.times{|i|
	(i...$memo.size).each{|j|
		q=n-$memo[i]-$memo[j]
		break if q<$memo[j]
		idx1=(j...$memo.size).bsearch{|k|$memo[k]>=q}||$memo.size
		idx2=(j...$memo.size).bsearch{|k|$memo[k]>q}||$memo.size
		r+=idx2-idx1
	}
}
p r
