#!/usr/bin/env ruby
h={}
$<.each{|e|
	a,b=e.chomp.split(',')
	h[b]=a
}
t=0
g=Hash.new 0
h.each{|k,v|g[v]+=1;t+=1}
g.sort_by{|k,v|[-v,k]}.each{|k,v|
	puts '%s:%d%%'%[k,v*100/t]
}
