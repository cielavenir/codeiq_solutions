#!/usr/bin/ruby
H,W=gets.split(',').map(&:to_i)
p H*W*2+(H*W%2==1 || H==1 || W==1 ? 2 : 0)