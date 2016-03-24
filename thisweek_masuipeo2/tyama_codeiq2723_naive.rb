#!/usr/bin/ruby
#coding:utf-8

N=gets.to_i
r=0
[*0..N-2].permutation{|a|
	a<<N-1
	r+=[*0..N-1].permutation.count{|b|
		N.times.all?{|i|b[i]!=a[i]&&b[i]!=a[(i+1)%N]}
	}
}
p r