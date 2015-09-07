#!/usr/bin/ruby
File.open(ARGV[0]){|input|
	n=input.gets.to_i
	b=input.gets.to_i
	#b=378 # sample
	b=37317001
	item_str=input.map(&:chomp)
	item=item_str.map{|e|e.split.map(&:to_i)}

	result_str='0'*n
	i=1
	while b>0
		puts "Iteration #{i}: #{n} #{b}"
		IO.popen('./629.out','r+b'){|io|
			start_time=Time.now
			io.puts n
			io.puts b
			io.puts item_str[0,n]
			io.close_write
			v=io.gets.to_i
			end_time=Time.now
			puts "took #{(end_time-start_time)*1.0}sec."
			las=io.gets.to_i
			puts "Value: #{v}"
			puts "Last: #{las}, weight is #{item[las].last}."
			n=las
			result_str[las,1]='1'
			b-=item[las].last
		}
		i+=1
	end
	puts result_str
}