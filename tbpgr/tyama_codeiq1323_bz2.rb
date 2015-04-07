#!/usr/bin/ruby
#coding:utf-8
IO.popen('7z a -tbzip2 -mx=9 -so -si X','r+b'){|io|
	io.write DATA.read
	io.close_write
	puts 'echo '+[io.read].pack('m0')+'|base64 -d|bunzip2'
}
__END__
:two::seven::six:
:nine::five::one:
:four::three::eight: