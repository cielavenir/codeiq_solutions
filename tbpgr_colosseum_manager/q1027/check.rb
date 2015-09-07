#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.size

__END__
With LF:
MD5  7737751c1317f3f9967fb28ac4f453f6
SHA1 36eb9d6cb15d9f7381cfddd78e4300d150de977c
Without LF:
MD5  ef1f1a428303f0fbd6c4b843573919f2
SHA1 87023a281721700582e8b9cee50d85fe680083c5