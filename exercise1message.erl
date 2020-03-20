%%%-------------------------------------------------------------------
%%% @author M_P20
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%% maxList ist eine Funktion, die das größte Element einer Liste zurückgibt
%%% @end
%%% Created : 18. Mar 2020 11:44 AM
%%%-------------------------------------------------------------------
-module(exercise1message).
-author("M_P20").
-export([avg_server1/1, avg_server2/0, avg_server2/1, queue_server/1, new_queue/0, push/2,pop/1]).

avg_server1(Avg) ->
  io:fwrite("Current average is ~p~n", [Avg]),
  receive
    Num -> avg_server1((Avg + Num) / 2)
  end.

avg_server2() ->
  receive
    Num -> avg_server2([Num])
  end.
avg_server2(Nums) ->
  io:fwrite("The average of ~p is ~p~n", [Nums, sum(Nums) / length(Nums)]),
  receive
    Num -> avg_server2(Nums ++ [Num])
  end.
sum([]) -> 0;
sum([X|Xs]) -> X + sum(Xs).

% Main server function
queue_server(Q) ->
  receive
    {Pid, push, Val} -> Pid ! ok, queue_server(Q ++ [Val]) ;
    {Pid, pop} when length(Q) > 0 -> Pid ! hd(Q), queue_server(tl(Q))
  end.

% API
new_queue() -> spawn(fun() -> queue_server([]) end).
push(Pid, Val) ->
  Pid ! {self(), push, Val},
  receive ok -> ok end.
pop(Pid) ->
  Pid ! {self(), pop},
  receive Val -> Val end.