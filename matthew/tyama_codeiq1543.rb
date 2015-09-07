#!/usr/bin/ruby
#coding:utf-8
require 'prime'
Prime.each{|e|if (2014-e).prime? then puts e.to_s+" "+(2014-e).to_s;exit end}