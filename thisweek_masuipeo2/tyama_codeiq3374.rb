#!/usr/bin/ruby
#O(1)でいけてしまいました^^;
d,r=gets.to_i.divmod 4;p d*8+[1,2,4,7][r]
#d,r=(gets.to_i-1).divmod 4;p d*8+[2,4,7,9][r]