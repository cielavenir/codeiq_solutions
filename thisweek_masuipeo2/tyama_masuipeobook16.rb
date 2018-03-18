#!/usr/bin/ruby
N=1234567
p (1...-~N/2).count{|i|i.gcd(N-i)==1}
