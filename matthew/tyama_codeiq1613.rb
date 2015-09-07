#!/usr/bin/ruby
require 'prime'
p Prime.each.each_cons(2).lazy.map{|x,y|x+y}.take(12).to_a[10]