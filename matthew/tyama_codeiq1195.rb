#!/usr/bin/ruby
#day === least integer where 2**day-1>=TARGET <=> day>=log2(TARGET+1)
TARGET=80000000
p Math.log2(TARGET+1).ceil