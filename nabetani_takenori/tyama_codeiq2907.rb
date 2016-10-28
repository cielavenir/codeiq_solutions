#!/usr/bin/ruby
#coding:utf-8

#日本語メソッド名使うぐらいならメソッド切り出さないほうがましだったか？
def 当該桁数の数の個数(s,d)
	d==1 ? s.size : (s[0]=='0' ? s.size-1 : s.size)*s.size**(d-1)
end

def get(s,t)
	n=0
	i=0
	loop{
		i+=1
		x=当該桁数の数の個数(s,i)
		break if x+n>t
		n+=x
	}
	t-=n
	#i桁の数のt番目(0-indexed)
	a=[]
	i.times{
		d,r=t.divmod(s.size)
		a<<r
		t=d
	}
	a.reverse.map.with_index{|e,j|s[i>1&&j==0&&s[0]=='0' ? e+1 : e]}*''
end

n,s=gets.split.zip([:to_i,:to_s].map(&:to_proc)).map{|x,y|y[x]}
ma=0
(1..n).each{|i|
	ma+=当該桁数の数の個数(s,i)
}
if ma%2==0
	puts [get(s,ma/2-1),get(s,ma/2)]*','
else
	puts get(s,ma/2)
end