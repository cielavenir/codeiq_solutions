#!/usr/bin/ruby
require 'bigdecimal'
a=gets.split(',').map(&method(:BigDecimal))
idx=a.size.times.max_by{|i|a[i]}
a.sort!
if a[0]*a[0]+a[1]*a[1]==a[2]*a[2]
	puts (65+idx).chr
else
	puts :x
end