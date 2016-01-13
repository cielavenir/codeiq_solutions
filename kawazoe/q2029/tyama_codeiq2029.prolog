#!/usr/bin/xpce -f
:- prompt(_,'').

solve(R,I,N,RET) :-
	X is N - I*(I-1)//2,
	II is I+1,
	(X>=I ->
		(mod(X,I)=:=0 -> RR is R+X//I,solve(RR,II,N,RET); solve(R,II,N,RET))
	;
		RET is R
	).

main :- not(at_end_of_stream(user_input)),readln([N]),N>0 -> solve(0,2,N,R),format("~w\n",[R]),main; halt.
:- initialization(main).