#!/usr/bin/env crystal
p (4..1/0.0).each.select{|i|(2...i).any?{|j|i%j<1}}.first(gets.not_nil!.to_i).sum
