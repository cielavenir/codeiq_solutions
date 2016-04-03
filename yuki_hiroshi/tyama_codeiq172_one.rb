#!/usr/bin/ruby
require 'enumerable/lazy' if RUBY_VERSION<'2.0'
puts [1,1].instance_eval{each_cons(2).lazy.map{|x,y|push x+y}.drop(40-1).next}.last(2)*'x'