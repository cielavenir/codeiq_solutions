#!/usr/bin/env ruby
n=gets.to_i
a=12.times.select{|i|n[i]==1}
puts a.size.times.map{|i|
	b=(a[(i+1)%a.size]-a[i])%12
	r=(b==6 ? 2 : 3)
	b+=1 if a[i]%2==1
	r+(b-1)/2
}.sort*','
