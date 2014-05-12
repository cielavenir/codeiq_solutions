-module(prog).
-export([main/0]).
main()->lists:map(fun(I)->io:put_chars([97+I,65+I,227,129,130+I,227,130,162+I,227,130,162+I,227,129,130+I,65+I,97+I])end,lists:seq(0,25)).