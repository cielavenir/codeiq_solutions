#!/usr/bin/env ruby

def dfs(n)
	return 0 if n==0
	return 1 if n==1
	return 21*7**(n-2)+7*dfs(n-2) # 00,11,22,55,69,88,96
end
n=gets.to_i
p dfs(n)

=begin
p %w(0 1 2 5 6 8 9).repeated_permutation(n).count{|a|
	s=a*''
	if s.tr('69','96').reverse>s
		#p s
		true
	end
}
=end

__END__
66... 99...
きみは妖精の商人のフレンズ(以下略)
