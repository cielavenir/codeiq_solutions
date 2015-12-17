#!/usr/bin/ruby
require'matrix';p (Matrix[[1,1],[1,0]]**(gets.to_i+3&~1))[1,0]-1