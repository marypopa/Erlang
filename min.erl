-module(min).
-author("M_P20").
-export([min/1]).

min([]) -> error;
min([Head|Rest]) ->
    Min = fun(A, B) when A < B -> A;
             (A, B) when A > B -> B end,
    lists:foldl(Min, Head, Rest).       
