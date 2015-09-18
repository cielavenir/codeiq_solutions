#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.bytesize

__END__
With LF:
MD5  84a6e16dc835213cb47725a5357b1e65
SHA1 a8db65a47efc64a1f30a65aa808131abcf2f2cb9
Without LF:
MD5  b5177c53b7d7f6e0998aa60966fea2dc
SHA1 cecc2087e04fee5013e201b0caa79103c0b6a564