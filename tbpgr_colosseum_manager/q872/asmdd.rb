#!/usr/bin/ruby
$<.binmode
puts 'dd '+$<.read.bytes.to_a.each_slice(4).to_a.map{|f|
	f.each_with_index.reduce(0){|s,e|
		s|(e[0]<<(8*e[1]))
	}.to_s(10)
}*','