#!/usr/bin/ruby
A=gets.split
A.shift
n=A.shift.to_i
q=''
A.each{|e|
	n*=2 if e=='-e'
	q='?' if e=='-q'
}
puts 'sho'+'hey'*n+q