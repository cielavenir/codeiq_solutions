#!/usr/bin/ruby
puts$<.map{|e|e.send(e=~/[aiueoAIUEO]/?:upcase: :downcase)}
