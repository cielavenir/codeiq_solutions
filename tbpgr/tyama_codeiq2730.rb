#!/usr/bin/ruby
A=$<.lines.to_a;N=A.count{|e|e.start_with? ?#};puts "code:%d\ncomment:%d"%[A.size-N,N]