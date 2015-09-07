#!/usr/bin/xpce -f
:- prompt(_,'').

fib(N,A,B) :- N<2 -> format("~d~n",A); M is N-1,BB is A+B,format("~d,",A),fib(M,B,BB).
main :- readln([N]),fib(N,0,1),halt.
:- initialization(main).