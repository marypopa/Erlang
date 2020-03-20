%%%-------------------------------------------------------------------
%%% @author M_P20
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%% maxList ist eine Funktion, die das größte Element einer Liste zurückgibt
%%% @end
%%% Created : 18. Mar 2020 11:44 AM
%%%-------------------------------------------------------------------
-module(exercise1).
-author("M_P20").
-export([min/1, max/1, reverse/1, find/2,delete/2, flatten/1,square/1,filter/1]).

min([]) -> error;
min([Head|Rest]) ->
    Min = fun(A,  B) when A < B -> A;
             (_A, B)            -> B end,
    lists:foldl(Min, Head, Rest).

max([]) -> error;
max([Head|Rest]) -> 
    Max = fun(A, B) when A>B -> A;
             (A, B) when A<B -> B end,
    lists:foldl(Max,Head,Rest).        

reverse([]) -> [];
reverse([Head]) -> Head;
reverse([H,T]) -> [T,H];
reverse([Head|Tail]) -> reverse(Tail) ++ [Head].

find(X,[X]) -> {found, X};
find(X,[]) -> {not_found,X};
find(X,[H|T]) ->
    if X == H -> {found, X};
       X /= H -> find(X,T)
    end.

delete(_,[]) -> [];
delete(X,[X]) -> [];
delete(X,[H|T])->
    if X == H -> T;
       X /= H -> [H] ++ delete(X,T)
    end.

flatten([]) -> [];
flatten([L|T]) -> L ++ flatten(T).

square([]) -> [];
square([X|Xs]) -> [X*X] ++ square(Xs).

filter([]) -> [];
filter([H|T]) -> 
    if H rem 2 =:= 0 -> [H] ++ filter(T);
       H rem 2 /= 0 -> filter(T)
    end.
