#!/usr/bin/ruby
require 'prime'
p Prime.each(1000).select{|e|e.to_s==e.to_s.reverse}.last