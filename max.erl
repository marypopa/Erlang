-module(max).
-author("M_P20").
-export([max/1]).

max([Head|Rest]) -> 
    Max = fun(A, B) when A>B -> A;
             (A, B) when A<B -> B end,
    lists:foldl(Max,Head,Rest).        
