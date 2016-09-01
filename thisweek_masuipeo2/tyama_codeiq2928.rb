#!/usr/bin/ruby
#coding:utf-8

R=[1, 2, 4, 11, 31, 83, 227, 616]
if defined?(R)
	n=gets.to_i
	p R[n]
	exit
end

$memo={}
def dfs(n,d)
	if n==0
		return d
	else
		$memo[[n,d]]||=lambda{
			r=0
			n.times{|i|
				r+=Fact[i]*Pascal[n-1][i]*dfs(n-1-i,d+1)
			}
			r
		}.call
	end
end

Pascal=[[1]]
Fact=[1]
1.upto(1000){|i|
	Pascal<<[1]+Pascal[-1].each_cons(2).map{|x,y|x+y}+[1]
	Fact<<i*Fact[-1]
}

r=[]
(1..1/0.0).each{|i|
	p i
	v=(dfs(i,0)+Fact[i]-1)/Fact[i]
	r<<i while !r[v-1]
	break if r[7]
}
p r

__END__
#補題：N人がいるとき、N人全員が1グループになるのは(N-1)!通り
N=gets.to_i
p [*0...N].permutation.count{|a|
	cur=a[0]
	i=1
	while cur!=0
		cur=a[cur]
		i+=1
	end
	i==N
}