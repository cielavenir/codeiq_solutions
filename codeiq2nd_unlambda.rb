#!/usr/bin/ruby
#coding:utf-8

STR="CodeIQ 2nd Anniversary\n"
bytes=STR.bytes.to_a
print '`'*bytes.size
bytes.each{|e|print e==10?'r':('.'+e.chr)}
puts 'i'