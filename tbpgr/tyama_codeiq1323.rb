#!/usr/bin/ruby
#coding:utf-8
IO.popen('7z a -tgzip -mx=9 -so -si X','r+b'){|io|
	io.write DATA.read
	io.close_write
	puts 'echo '+[io.read].pack('m0')+'|base64 -d|gunzip'
}
__END__
:two::seven::six:
:nine::five::one:
:four::three::eight: