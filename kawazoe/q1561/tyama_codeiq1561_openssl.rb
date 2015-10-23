#!/usr/bin/ruby
require 'openssl'
M=1000000
REV3=3.to_bn.mod_inverse(M)
n=gets.to_i
p ((16.to_bn.mod_exp(n,M)-1)*2*REV3%M).to_i

__END__
@paiza_run ruby:require'openssl';M=1000000;N=10000000000;p ((16.to_bn.mod_exp(N,M)-1)*2*(3.to_bn.mod_inverse(M))%M).to_i