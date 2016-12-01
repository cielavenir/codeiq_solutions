#!/usr/bin/ruby
require'prime';N=gets.to_i;p (1..N).reduce(:*).prime_division.reduce(1){|s,(n,p)|s*(n**(p*N+1)-1)/(n-1)%1000003}
