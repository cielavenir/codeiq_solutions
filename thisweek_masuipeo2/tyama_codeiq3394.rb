#!/usr/bin/ruby
n=gets.to_i-1
p [*0...n].permutation.count{|z|
	[0,n-1]&[z[0],z[-1]]==[] && (0...n-1).all?{|i|(z[i]-z[i+1]).abs>1}
}
