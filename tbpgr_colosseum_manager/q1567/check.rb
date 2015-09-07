#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
p $<.read.chomp.size

__END__
With LF:
MD5  65011d66f2c5b6b3d319f65aea15b7bc
SHA1 4608cebe114fc363ae60f3c917787701d76685e0
Without LF:
MD5  dc9dec4e60b5911211b26b83772d22e4
SHA1 f8126717399556551eba51524e13438818d5363f