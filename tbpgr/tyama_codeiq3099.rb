#!/usr/bin/env ruby
h={}
$<.each{|e|
	a=e.chomp.split(',')
	h[a[0]]=a.size-1
}
puts h.sort_by{|k,v|-v}.map{|e|e*','}
