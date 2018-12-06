#!/usr/bin/env elixir
defmodule CodeIQ983 do
	def calc2(d,num,bse) do
		if d==0 do
			rem(num,bse)
		else
			calc2(d-1,div(num,bse),bse)
		end
	end
	def calc(digits,expbase,bse,x,n) do
		if x>n do
			calc2(digits-1-rem(n,digits),expbase+div(n,digits),bse)
		else
			calc(digits+1,expbase*bse,bse,(digits+1)*(expbase*bse)*(bse-1),n-x)
		end
	end
	def main() do
		s=IO.gets('')
		if s != :eof do
			n=elem Integer.parse(s),0
			if n != 0 do
				IO.puts calc(1,1,10,9,n+3)
				main
			end
		end
	end
end
CodeIQ983.main