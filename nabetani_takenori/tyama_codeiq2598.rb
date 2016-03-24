#!/usr/bin/env ruby
x,y,z=gets.split(?.)
x=x.to_i
y=y.ord-68
(x-=1;y+=11)if y<2
putc (6+2*x-x/20+x/80-x/4000+z.to_i+219*y/7)%7+116

__END__
w=31+31+32+31+31 + 345*(x-1)-x/20+x/80-x/4000+z.to_i+219*(y-3)/7-62
$><<((w+5)%7+116).chr