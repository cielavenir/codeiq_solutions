#!/usr/bin/ruby
#coding:utf-8
require 'tempfile'

#LazyK directory refers to https://github.com/msullivan/LazyK
#can be nil (then Lazy K generation will be skipped)
LAZYK_DIR=ENV['HOME']+'/devel/LazyK/eg'

if ARGV.empty? || STDIN.tty?
	STDERR.puts 'codeiq_deathgen.rb prefix < input'
	exit
end
STR=STDIN.read.chomp
PWD=Dir.pwd

puts 'Intercal'
IO.popen(%Q(ruby "#{File.dirname(__FILE__)}/codeiq2nd_intercal.rb"),'r+'){|io|
	io.write STR
	io.close_write
	File.write(ARGV[0]+'.intercal',io.read)
}
puts 'Unlambda'
IO.popen(%Q(ruby "#{File.dirname(__FILE__)}/codeiq2nd_unlambda.rb"),'r+'){|io|
	io.write STR
	io.close_write
	File.write(ARGV[0]+'.ul',io.read)
}
puts 'Whitespace'
IO.popen(%Q(ruby "#{File.dirname(__FILE__)}/codeiq2nd_whitespace.rb"),'r+'){|io|
	io.write STR
	io.close_write
	File.write(ARGV[0]+'.ws',io.read)
}
puts 'Brainfuck'
Tempfile.open('bfgen'){|f|
	f.close
	system(%Q(gcc -O2 -Wall -o "#{f.path}" "#{File.dirname(__FILE__)}/codeiq2nd_bf.c"))
	IO.popen(f.path,'r+'){|io|
		io.write STR
		io.close_write
		File.write(ARGV[0]+'.bf',io.read)
	}
}
puts 'Alang'
IO.popen(%Q(ruby "#{File.dirname(__FILE__)}/codeiq2nd_alang.rb"),'r+'){|io|
	io.write STR
	io.close_write
	File.write(ARGV[0]+'.alang',io.read)
}
if LAZYK_DIR
	puts 'Lazy K'
	Tempfile.open('lazygen',LAZYK_DIR){|f|
		f.close
		IO.popen(%Q(ruby "#{File.dirname(__FILE__)}/codeiq2nd_lazy.rb"),'r+'){|io|
			io.write STR
			io.close_write
			File.write(f.path,io.read)
		}
		Dir.chdir(LAZYK_DIR)
		io=IO.popen(%Q(gosh "#{f.path}"))
		Dir.chdir(PWD)
		File.write(ARGV[0]+'.lazy',io.read)
		io.close
	}
end