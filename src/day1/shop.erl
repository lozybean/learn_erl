%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 九月 2016 13:20
%%%-------------------------------------------------------------------
-module(shop).
-author("Administrator").

%% API
-export([test/0, total/1]).
-import(lists, [map/2, sum/1]).

test() ->
  Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}],
  123 = total(Buy),
  123 = total2(Buy),
  123 = total3(Buy),
  'test worked 123'.

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total([{What, N} | T]) ->
  cost(What) * N + total(T);
total([]) -> 0.

total2(L) ->
  sum(map(fun({What, N}) -> cost(What) * N end, L)).

total3(L) ->
  sum([cost(What) * N || {What, N} <- L]).

