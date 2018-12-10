#!/usr/bin/ruby
require'prime'
p (4..).lazy.select{|i|!i.prime?}.take(gets.to_i).sum
