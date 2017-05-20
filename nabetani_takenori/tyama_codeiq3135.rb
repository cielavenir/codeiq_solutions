#!/usr/bin/env ruby
if $0==__FILE__
	while gets
		y,x=$_.split(',');x=x.to_i
		if x<1||18<x
			puts :-
			next
		elsif y=='L'
			puts x<16 ? 56+x : :-
			next
		elsif y=='A'
			puts x<16 ? 88+x : :-
			next
		end
		y=y.to_i
		if y<1||8<y
			puts :-
		elsif y==1
			if x==1
				p 1
			elsif x==18
				p 2
			else
				puts :-
			end
		elsif y<4
			if x<3
				p 2+(y-2)*8+x
			elsif x>12
				p 2+(y-2)*8+x-10
			else
				puts :-
			end
		elsif y<6
			p 18+(y-4)*18+x
		elsif y<8
			if x<3
				p 54+(y-6)*32+x
			elsif x==3
				puts({6=>:L,7=>:A}[y])
			elsif x>3
				p 54+(y-6)*32+x+14
			end
		else
			puts x<3 ? 118+x : :-
		end
	end
end
