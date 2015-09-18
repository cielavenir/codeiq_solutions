#!/usr/bin/env escript
-module(prog).
-export([main/0]).

calc(R,I,N) ->
	X=N - (I*(I-1) div 2),
	if
		X>=I -> if
			X rem I==0 -> calc(R+(X div I),I+1,N);
			true -> calc(R,I+1,N)
		end;
		true -> R
	end.

main() ->
	case io:get_line(standard_io,"") of 
		eof -> true;
		X ->
			N=list_to_integer(string:strip(X,right,10)),
			if
				N>0 -> io:format("~w\n",[calc(0,2,N)]),main();
				true -> true
			end
	end.

main(_) -> main().