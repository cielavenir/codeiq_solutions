#!/usr/bin/ruby
require'json';$><<JSON.parse(gets).map{|x|y=x/19;((y+(y*19-x).abs/10)*19-x).abs}*?,