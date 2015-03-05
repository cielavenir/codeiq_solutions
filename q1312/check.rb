#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.size

__END__
With LF:
MD5  88070c36265c9a5c4cdd3c686c1a2df0
SHA1 1ab7d51e5755c4dec7fbd727889e0beac89cfe41
Without LF:
MD5  10ecaeafd40baa65ebdc8c5f25fc9e38
SHA1 85f2cdc5b77bebef2806625e8c2f2f7576d7529e