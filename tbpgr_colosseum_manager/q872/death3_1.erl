-module(prog).
-export([main/0]).
main()->io:put_chars(lists:seq(65,122)).