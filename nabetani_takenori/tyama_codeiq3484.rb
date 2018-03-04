#!/usr/bin/ruby
S=gets.chomp
def chk(s,e)
	while s<e
		return false if S[s]!=S[e]
		s+=1
		e-=1
	end
	true
end
$memo={}
def dfs(s)
=begin
	return 0 if s==S.size
	$memo[[s,e]]||=->{
		r=chk(s,e)?1:0
		(s+1...e).each{|i|
			r+=dfs(s,i)*dfs(i+1,e)
		}
		r
	}.()
=end
	return 1 if s==S.size
	$memo[s]||=->{
		r=0
		(s+1...S.size).each{|i|
			next if !chk(s,i)
			r+=dfs(i+1)
		}
		r
	}.()
end
p dfs(0) #,S.size-1)
