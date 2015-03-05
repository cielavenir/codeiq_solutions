#!/usr/bin/ruby
require 'zlib'
x=''
if true
	IO.popen('zlibrawstdio c9','r+b'){|io|
		io.write DATA.read
		io.close_write
		x=io.read
	}
else
	x=Zlib.deflate(DATA.read,9)
end

puts "require'zlib';puts Zlib.inflate'"+[x].pack('m0')+"'.unpack('m')[0]"
__END__
treetreetreefiregoldtreetreetreetreegoldtreegoldtreegoldtreegoldtreegoldtreetreegoldtreegoldtreetreetreegoldtreetreetreewaterwatertreetreewatergoldgoldtreegoldtreegoldtreegoldtreegoldtreetreegoldtreegoldtreetreetreegoldtreetreefiregoldgoldwatermoontreemoontreegoldgoldtreewatergoldgoldtreetreegoldgoldtreetreemoonwatergoldgoldwatergoldtreetreemoongoldgoldmoon