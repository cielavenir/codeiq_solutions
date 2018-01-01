#!/usr/bin/ruby
$memo={1=>0}
def dfs(n)
	$memo[n]||=(n/2).downto(1).map{|i| #to avoid SystemStackError
		g=i.gcd(j=n-i)
		j/g+dfs(i)+i/g+dfs(j)
	}.min
end
p dfs(gets.to_i)
__END__
実行くんだと2500まで耐えられるようです
