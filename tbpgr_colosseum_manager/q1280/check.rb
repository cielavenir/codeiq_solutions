#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.size

__END__
With LF:
MD5  b933314b44648e103a14e20d83435330
SHA1 3ca83978062758cee33558bb61267f381257b63f
Without LF:
MD5  e02e81b709b01a2420a1d59bab71a227
SHA1 7c5c7c0a2155e0d9a8b765abe039ea172ced2636