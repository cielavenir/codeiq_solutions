#!/usr/bin/env crystal
a,b=gets.not_nil!.split.map &.to_i
puts [a,10-a,b-10+a].join(",")

# 3 9
# 3,7,2

