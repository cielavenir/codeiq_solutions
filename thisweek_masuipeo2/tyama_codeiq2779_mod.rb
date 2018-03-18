#!/usr/bin/env ruby
N=gets.to_i
p (1..N).reduce(1,:*)*[0,N-3].max/6
