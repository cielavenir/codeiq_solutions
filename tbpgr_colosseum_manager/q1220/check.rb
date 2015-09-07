#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.size

__END__
With LF:
MD5  0c19dc0b538648f11e19f2ff97032595
SHA1 4dc5ec2e48a23d85bfe3dd620122140dc760c2d9