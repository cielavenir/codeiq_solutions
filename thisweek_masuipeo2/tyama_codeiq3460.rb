#!/usr/bin/ruby
m,n=gets.split.map &:to_i
F=[1,1];2.upto([m,2*n].max){|i|F<<i*F[-1]}
p 2**(m-n<<1)*F[m]*F[n*2]/F[m-n]/F[n]**3
#p comb(m,n)*comb(n*2,n)*2**(m-n<<1)
