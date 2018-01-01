#!/usr/bin/env ruby
class Counter < Hash
	def initialize(a=[])
		super
		self.default=0
		a.each{|e|self[e]+=1}
	end
	def self.[](*a)
		new(a)
	end
end
def Counter(a=[]) Counter.new(a) end

def f(n,x) 4*x*(n-x)/n end

n=gets.to_i
a=(0..n).map{|i|f(n,i)}
c=Counter(a)
depth=[1]+[nil]*(n-1)+[2]
(0..n).select{|i|c[i]==0}.each{|i|
	b=[i]
	h={i=>0}
	loop{
		i_prev=i
		i=f(n,i)
		#既に発見したループにぶつかった場合は特殊処理
		h[i]=h[i_prev]+1 if depth[i]
		break if h.has_key?(i)
		h[i]=h[i_prev]+1
		b<<i
	}
	#v=i_origが属するループの長さ
	#fro=bの中でループ部が始まるインデックス
	v=depth[i]
	fro=h[i]
	if !v
		to=h.size
		v=to-fro
		(fro...to).each{|j|depth[b[j]]=v}
	end
	(0...fro).each{|j|depth[b[j]]=v+fro-j}
}
p depth.reduce(:+)
