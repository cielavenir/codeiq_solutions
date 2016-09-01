#!/usr/bin/ruby
#coding:utf-8
require 'prime'
p gets.to_i.prime_division.reduce(1){|s,(n,p)|s*(n==2?(p+1):(p+1)*(p+2)*(p+3)/6)}