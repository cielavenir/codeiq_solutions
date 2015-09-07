#!/usr/bin/ruby
File.open(ARGV[0]){|input|
	n=input.gets.to_i
	b=input.gets.to_i
	item_str=input.map(&:chomp)
	item=item_str.map{|e|e.split.map(&:to_i)}
	File.open(ARGV[1]){|output|
		v=output.gets.to_i
		a=output.gets.chomp.each_char.with_index.select{|c,i|c=='1'}.map(&:last)
		p a.map{|e|item[e].first}.reduce(:+)
		p a.map{|e|item[e].last}.reduce(:+)
	}
}