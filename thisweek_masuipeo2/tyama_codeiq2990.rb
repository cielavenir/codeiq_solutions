#!/usr/bin/ruby
$memo={}
def dfs(m,n,w,mi,ma)
	if m==0
		return n==0 ? 1 : 0
	end
	$memo[[m,n,mi,ma]]||=(ma-w..mi+w).reduce(0){|s,i|
		s+(0<=i&&i<=n ? dfs(m-1,n-i,w,*[ma,mi,i].minmax) : 0)
	}
end
m,n,w=gets.split.map(&:to_i)
p (0..n).reduce(0){|s,i|
	s+dfs(m-1,n-i,w,i,i)
}
