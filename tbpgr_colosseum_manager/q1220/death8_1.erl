-module(prog).
-export([main/0]).
main()->lists:map(fun(I)->io:format("~s~c~s~n",[lists:flatten(lists:duplicate(I,"A")),66+I,lists:flatten(lists:duplicate(24-I,"A"))]) end,lists:seq(0,24)).