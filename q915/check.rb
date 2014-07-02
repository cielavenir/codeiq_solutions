#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ is required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'
src=$<.read.chomp
duplicate=src.size-src.chars.to_a.uniq.size
puts "Length:    #{src.size}"
puts "Duplicate: #{duplicate}"
puts "Point:     #{-src.size*(duplicate+1)}"

__END__
With LF:
MD5  ee20be6c36113516aa1a1b7da8abf374
SHA1 da48eeb0128c8990115f8dacf5a6cf86f7f177ad
Without LF:
MD5  b289307d6d99758f704730241c860b72
SHA1 781974eda4e1285198ed79e7e561ed8903857194