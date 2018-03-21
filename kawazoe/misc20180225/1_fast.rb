#!/usr/bin/ruby
W,H,M=gets.split.map &:to_i
p (H*1.0/-~W).round(7)
