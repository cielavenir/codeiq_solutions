#!/usr/bin/env ruby
d=gets.split.map(&:to_i).reduce(:-).abs
p (1<<(d-1)) + (1<<(29-d-1)) - 1