#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.size

__END__
With LF:
MD5  cec0f099a6903bbaf15202d604dc6a9e
SHA1 d03f696f14aa1710ab690bd2664ee87c22cb134c
Without LF:
MD5  a81a88266477c3f4836e3e75d600edb1
SHA1 38185e134cb039a956d0e8cade32187dbe4688ee