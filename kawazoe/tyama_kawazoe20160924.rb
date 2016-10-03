#!/usr/bin/ruby
$memo={}
#nが回文数になるまでの変換回数
def dfs(n)
	return 0 if n.to_s==n.to_s.reverse
	$memo[n]||=1+dfs(n+n.to_s.reverse.to_i)
end
p (10..1/0.0).find{|i|
	begin
		dfs(i)>25
	rescue SystemStackError => e
		true
	end
}
# 196
# 196は回数が発散するっぽい…不思議なものです。
