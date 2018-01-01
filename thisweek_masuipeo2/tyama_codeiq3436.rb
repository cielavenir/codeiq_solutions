#!/usr/bin/ruby
def dfs(n,s)
	if n==1
		{1=>1}
	else
		r=Hash.new 0
		(s..9).each{|e|
			if n%e==0
				r[1]+=1 if n==e
				dfs(n/e,e+1).each{|k,v|
					r[k+1]+=v
				}
			end
		}
		r
	end
end
n,m=gets.split.map(&:to_i)
p (1..32768).count{|i|
	dfs(i,2)[n]==m
}
# 枝刈りせずに通せるならいいんじゃないってことで
