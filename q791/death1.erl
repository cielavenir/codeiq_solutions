-module(prog).
-export([main/0]).
main() -> io:format("~s~n",[string:to_upper("lds")]).