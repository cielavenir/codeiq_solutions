#!/usr/bin/env ruby
T=[1,5,10,50,100,500,1000,2000,5000,10000]
N=gets.to_i
A=[{0=>0}]
1.upto(N){|i|
	A[i]={}
	T.each_with_index{|e,j|
		if i>=e
			A[i-e].each{|k,v|
				A[i][k|1<<j]=[A[i][k|1<<j]||Float::INFINITY,v+1].min
			}
		end
	}
}
p A[N].group_by{|k,v|k.to_s(2).count('1')}.sort[-1][1].map(&:last).min
