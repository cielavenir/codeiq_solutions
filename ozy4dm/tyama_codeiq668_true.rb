#!/usr/bin/ruby
s='fhaal naq jvaql'.tr('A-Za-z','N-ZA-Mn-za-m')
puts s
a,b,c=s.split
puts a.size.times.map{|i|(a[i,1].ord&c[i,1].ord).chr}*''