-module(prog).
-export([main/0]).
main()->io:fwrite(string:join(lists:map(fun(I)->integer_to_list(I) end,lists:filter(
fun(I)->lists:all(fun(J)->I rem J>0 end,lists:seq(2,I-1)) end
,lists:seq(2,999))),":")).