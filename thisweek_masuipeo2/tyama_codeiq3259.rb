#!/usr/bin/env ruby
$memo={}
def dfs(n,a)
	if n==0
		return true
	end
	(1..a[0]-1).each{|i|
		b=[i]
		if a.all?{|e|
			b<<e-b[-1]
			b[-1]>0
		}
			if b.size==b.uniq.size&&b.all?{|e|!$memo.has_key?(e)}
				b.each{|e|$memo[e]=1}
				return true if dfs(n-1,b)
				b.each{|e|$memo.delete(e)}
			end
		end
	}
	false
end
min_value=[0,1,3,7,16,35,76,162,344,723]
n=gets.to_i
p (min_value[n]..1/0.0).find{|i|
	#p i
	$memo[i]=1
	f=dfs(n-1,[i])
	$memo.delete(i)
	f
}

__END__
def convolution(n)
	[*1..n].permutation.map{|a|
		a=a.each_cons(2).map{|x,y|x+y} while a.size>1
		a
	}.min
end
