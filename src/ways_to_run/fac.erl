%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 九月 2016 10:26
%%%-------------------------------------------------------------------
-module(fac).
-author("Administrator").

%% API
-export([fac/1, run/1]).

%% this can run as:
%% escript fac.erl 25
main([A]) ->
  I = list_to_integer(A),
  F = fac(I),
  io:format("factorial ~w = ~w~n", [I, F]),
  init:stop().

%% this can run as:
%% erl -noshell -s fac run 25
run([A]) ->
  I = list_to_integer(atom_to_list(A)),
  F = fac(I),
  io:format("factorial ~w = ~w~n", [I, F]),
  init:stop().

fac(0) -> 1;
fac(N) -> N * fac(N - 1).

