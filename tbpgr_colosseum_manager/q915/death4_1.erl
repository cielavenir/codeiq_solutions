-module(prog).
-export([main/0]).
main()->lists:map(fun(J)->lists:map(fun(I)->io:put_chars([36+I*J*2])end,lists:seq(0,40 div J))end,lists:seq(1,8)).