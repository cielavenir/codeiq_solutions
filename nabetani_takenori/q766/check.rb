#!/usr/bin/ruby
a=ARGV.map{|e|IO.read(e)}
r=0
a.each{|e|
	h={}
	e.each_char{|c|h[c]=1}
	puts h.size
	r+=h.size
}
h={}
a.join.each_char{|c|h[c]=1}
puts h.size
puts 'OK!' if r==h.size