-module(prog).
-export([main/0]).
main()->io:put_chars(lists:map(fun(N)->97+N rem 26-(8-N rem 8)div 8*32 end,lists:seq(0,207))).