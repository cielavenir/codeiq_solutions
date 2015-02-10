f(208).
f(N) :- Z is 97+N mod 26-(8-N mod 8)//8*32,format('~c',[Z]),M is N+1,f(M).
main :- f(0),halt.
:- initialization(main).