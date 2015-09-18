#!/usr/bin/env elixir
defmodule StepUpSum do
	def calc(r,i,n) do
		x = n-div(i*(i-1),2)
		if x>=i do
			if rem(x,i)==0 do
				calc(r+div(x,i),i+1,n)
			else
				calc(r,i+1,n)
			end
		else
			r
		end
	end
	def main() do
		s=IO.gets('')
		if s != :eof do
			n=elem Integer.parse(s),0
			if n != 0 do
				IO.puts calc(0,2,n)
				main
			end
		end
	end
end
StepUpSum.main