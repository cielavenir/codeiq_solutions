#!/usr/bin/env ruby
n=gets.to_i
(p 6;exit) if n==1
f=('3.'+DATA.read[0,n]).to_f
p (1..1/0.0).find{|i|((f*i).ceil.to_f/i).to_s[0,n+2]==f.to_s}

#13 => 6535219 22sec
__END__
1415926535897932384626433832795028841971693993751058209749445923078164
