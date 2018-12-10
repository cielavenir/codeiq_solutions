#!/usr/bin/ruby
p (4..).lazy.select{|i|(2..Integer.sqrt(i)).any?{|j|i%j<1}}.take(gets.to_i).sum
