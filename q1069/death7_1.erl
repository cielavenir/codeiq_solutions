-module(prog).
-export([main/0]).
main()->lists:map(fun(I)->io:format(">~s.",[lists:flatten(lists:duplicate(I,"+"))]) end,"deathma colosseum").