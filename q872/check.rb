#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
src=$<.read
type=src.chars.to_a.uniq.size
puts "Length: #{src.size}"
puts "Type:   #{type}"
puts "Point:  #{-src.size*type}"

__END__
With LF:
MD5  c961e0f8793b66373f72f2fe5eb12c8d
SHA1 207f6c1949407a2129f073b67a1267642bef748a
Without LF:
MD5  c929d4316ed91b085c4f72cf15976f246
SHA1 39b0c62a13f03fc0314f52fe7d7b2ebd2aa1766d