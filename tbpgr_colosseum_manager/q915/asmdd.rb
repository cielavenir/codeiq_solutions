#!/usr/bin/ruby
$<.binmode
puts 'dq '+$<.read.bytes.to_a.each_slice(8).to_a.map{|f|
	'0x'+f.each_with_index.reduce(0){|s,e|
		s|(e[0]<<(8*e[1]))
	}.to_s(16).upcase
}*','