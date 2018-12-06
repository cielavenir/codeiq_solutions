#!/usr/bin/escript
-module(prog).
-export([main/0]).

calc2(D,Num,Bse) ->
	if
		D==0 -> Num rem Bse;
		D/=0 -> calc2(D-1,Num div Bse,Bse)
	end.
calc(Digits,Expbase,Bse,X,N) ->
	if
		X>N -> calc2(Digits-1-N rem Digits,Expbase+N div Digits,Bse);
		true -> calc(Digits+1,Expbase*Bse,Bse,(Digits+1)*(Expbase*Bse)*(Bse-1),N-X)
	end.

main() ->
	case io:get_line(standard_io,"") of
		eof -> true;
		X ->
			N=list_to_integer(string:strip(X,right,10)),
			io:format("~w\n",[calc(1,1,10,9,N+3)]),main()
	end.