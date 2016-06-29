#!/usr/bin/ruby
if RUBY_PLATFORM=~/linux/
	if true
		require 'fiddle'
		__popcount_fn=Fiddle::Function.new(Fiddle::Handle::DEFAULT['__sched_cpucount'],[Fiddle::TYPE_INT,Fiddle::TYPE_VOIDP],Fiddle::TYPE_INT)
		define_method(:popcount){|n|__popcount_fn.call(8,[n].pack('q'))}
	else
		require 'fiddle/import'
		module LibC
			extend Fiddle::Importer
			dlload 'libc.so.6'
			extern 'int __sched_cpucount(int,long long*)'
		end
		def popcount(n) LibC.__popcountdi2(8,[n]) end
	end
elsif RUBY_PLATFORM=~/darwin/
	if true
		require 'fiddle'
		__popcount_fn=Fiddle::Function.new(Fiddle::Handle::DEFAULT['__popcountdi2'],[Fiddle::TYPE_LONG],Fiddle::TYPE_INT)
		define_method(:popcount){|n|__popcount_fn.call(n)}
	else
		require 'fiddle/import'
		module LibC
			extend Fiddle::Importer
			dlload 'libSystem.dylib'
			extern 'int __popcountdi2(long)'
		end
		def popcount(n) LibC.__popcountdi2(n) end
	end
else
	def popcount(n) n==0 ? 0 : popcount(n/2)+n%2 end
end

p 1<<popcount(gets.to_i)