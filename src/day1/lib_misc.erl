%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 九月 2016 14:29
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("Administrator").

%% API
-export([qsort/1, pythag/1, perms/1, odds_and_evens/1, sleep/1,
  flush_buffer/0, priority_receive/0]).


qsort([]) -> [];
qsort([Pivot | T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
  [
    {A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A * A + B * B =:= C * C
  ].

perms([]) -> [[]];
perms(L) -> [
  [H | T] ||
  H <- L,
  T <- perms(L -- [H])
].

odds_and_evens(L) ->
  odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H | T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H | Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H | Evens])
  end;
odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.


sleep(T) ->
  receive
  after T ->
    true
  end.

flush_buffer() ->
  receive
    _Any ->
      flush_buffer()
  after 0 ->
    true
  end.

priority_receive() ->
  receive
    {alarm, X} ->
      {alarm, X}
  after 0 ->
    receive
      Any ->
        Any
    end
  end.