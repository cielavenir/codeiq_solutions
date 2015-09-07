#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.size

__END__
With LF:
MD5  e858cfb13426953477fe00000e1c828d
SHA1 e936a981909ab6671a98609a9e1b7dc730936d74
Without LF:
MD5  c5b67a9d3d04c62ed63f5bd572cb23cd
SHA1 16c876a228263e64ef6e724d5a6e4e769b2f0a28