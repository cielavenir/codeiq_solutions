#!/usr/bin/env ruby
require "prime"
require "matrix"
f={
	"HelloWorld"=>lambda{|n|"HelloWorld"*n},
	"FizzBuzz"=>lambda{|n|n%15==0?"FizzBuzz":n%3==0?"Fizz":n%5==0?"Buzz":n},
	"Prime"=>lambda{|n|Prime.each.take(n).last},
	"Fibonacci"=>lambda{|n|(Matrix[[1,1],[1,0]]**n)[1,0]},
}

x,n=gets.split(",")
puts f[x][n.to_i]