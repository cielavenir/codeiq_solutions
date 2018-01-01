#!/usr/bin/ruby
$memo={}
def dfs(n,d,q,a)
	if d==16
		return n==0 ? 1 : 0
	end
	if a.size==0
		#return $memo[[n,d,q]] if $memo[[n,d,q]]
	end
	r=0
	w=a.size
	H.each{|e|
		next if n<e
		next if w>0&&a[-1]==e
		next if q&&q[w]==e
		a<<e
		if a.size==4
			r+=dfs(n-e,d+1,a,[])
		else
			r+=dfs(n-e,d+1,q,a)
		end
		a.pop
	}
	#$memo[[n,d,q]]=r if a.size==0
	r
end
H=[0,4,16,48,128,320] #(1..6).map{|i|n=1<<i;n*(n.bit_length-2)} #bit_length
p dfs(gets.to_i,0,nil,[])
