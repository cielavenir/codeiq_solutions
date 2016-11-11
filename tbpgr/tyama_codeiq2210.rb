#!/usr/bin/env ruby
S=gets.chomp
p 6.times.reduce(0){|s,i|s+(S[i]==S[i+6]?2:S[i]==' '||S[i+6]==' '?0:1)}