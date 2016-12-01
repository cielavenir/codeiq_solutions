#!/usr/bin/ruby
#coding:utf-8
def bits(n)
	r=[]
	i=0
	while n>0
		r<<i if n%2>0
		n/=2
		i+=1
	end
	r
end
#当該階層の分割法
def cut(n,a,s,st,&blk)
	return to_enum(:cut,n,a,s,st) if !block_given?
	if n==0
		blk.call(a)
		return
	end
	(st..n).each{|i|
		cut(n-i,a|(1<<i),s|(1<<i),i+1,&proc) if s[i]==0
	}
end
#s:禁止数字の集合
$memo={}
def dfs(n,s)
	skey=s&((1<<n)-1)
	return $memo[[n,skey]] if $memo.has_key?([n,skey])
	r=[0]
	cut(n,0,s,1).each{|e|
		raise if e<(1<<1)
		# 分割法ごとに、下を独立に計算し、背反なもののみマージ
		raise if s+e!=(s|e)
		t=s|e
		b=[]
		bits(e).each{|i|
			b<<dfs(i,t)
		}
		raise if b.empty?
		b.shift.product(*b){|f|
			#if f.map{|e|bits(e).size}.reduce(:+)==bits(f.reduce(:+)).size
			#if f.combination(2).all?{|x,y|(x&y)==0}
			if f.reduce(:+)==f.reduce(:|)
				r<<f.reduce(:|)
			end
		}
	}
	$memo[[n,skey]]=r.map{|e|e+(1<<n)}
end
n=gets.to_i
p dfs(n,1<<n).size
