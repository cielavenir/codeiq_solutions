#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.size

__END__
With LF:
MD5  77e2640d788e285d5effd0097c7b1aa9
SHA1 a03884ad744a8f782b2605c319752c2897a39887
Without LF:
MD5  b1e6b22272db948bb9060578d326740d
SHA1 1c51fa5c443f96a5d86316a12fb89ab229630589