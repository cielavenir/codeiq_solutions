#!/usr/bin/env ruby
x,y,z=gets.split(?.);putc (x.to_i*2+z.to_i+220*(y.ord-65)/7)%7+116