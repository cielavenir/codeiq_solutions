#!/usr/bin/env ruby
#黄金比を連分数で表すことに帰着でき、これはフィボナッチ数列を用いることで容易に行える。
require'matrix'
def fib(n) (Matrix[[1,1],[1,0]]**n).row(1) end
n=gets.to_i
puts '%.10f'%Rational(*fib(n+1))