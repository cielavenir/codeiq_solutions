#!/usr/bin/ruby
#coding:utf-8

STR=STDIN.tty? ? "CodeIQ 2nd Anniversary\n" : STDIN.read
bytes=STR.bytes.to_a
print '`'*bytes.size
bytes.each{|e|print e==10?'r':('.'+e.chr)}
print 'i'