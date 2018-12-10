#!/usr/bin/env ruby
#Ruby/Crystal compatible
(1..9).each{|i|(1..9).each{|j|puts "%d+%d=%s%d" % [i,j,"~"*(i+j),i+j]}}
