-module(prog).
-export([main/0]).
main()->lists:map(fun(I)->io:fwrite(if
	I rem 15=:=0 -> "FIZZBUZZ";
	I rem 3=:=0 -> "fizz";
	I rem 5=:=0 -> "buzz";
	true -> integer_to_list(I)
end)end,lists:seq(1,50)).