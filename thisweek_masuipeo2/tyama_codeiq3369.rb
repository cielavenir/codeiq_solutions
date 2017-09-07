#!/usr/bin/ruby
#CodeIQは2.1なので手元ではお茶を濁しておく
require 'backports/2.1' if RUBY_VERSION<'2.1'
n=gets.to_i
b=n.bit_length-1 #Math.log2(n).to_i
r=n-2**b
puts '%d %d'%[2*r+n*b,n*-~n/2-1]
