f(123).
f(N) :- format('~c',[N]),M is N+1,f(M).
main :- f(65),halt.
:- initialization(main).