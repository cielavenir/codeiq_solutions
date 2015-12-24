#!/usr/bin/ruby
n=gets.to_i;p n%2==0 ? 0 : ((n-1>>1)+2..n-1).reduce(1,:*)/(1..n-1>>1).reduce(1,:*)
#Catalan(n-1>>1)