%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 九月 2016 17:10
%%%-------------------------------------------------------------------
-module(math_functions).
-author("Administrator").

%% API
-export([even/1, odd/1, filter/2, split/1, split1/1, split2/1]).


%% case expression
even(X) ->
  case X rem 2 of
    1 -> false;
    0 -> true
  end.


%% guard expression
odd(X) when 0 =:= X rem 2 ->
  false;
odd(X) ->
  true.

%% list generator
filter(F, L) ->
  [
    X ||
    X <- L,
    F(X)
  ].

split(L) ->
  split_acc(L, [], []).

split_acc([H | T], Even, Odd) ->
  case H rem 2 of
    1 -> split_acc(T, Even, [H | Odd]);
    0 -> split_acc(T, [H | Even], Odd)
  end;
split_acc([], Even, Odd) ->
  {lists:reverse(Even), lists:reverse(Odd)}.

split1(L) ->
  Odd = [X || X <- L, (X rem 2) =:= 1],
  Even = [X || X <- L, (X rem 2) =:= 0],
  {Even, Odd}.

split2(L) ->
  IsEven = fun(X) -> X rem 2 == 0 end,
  IsOdd = fun(X) -> X rem 2 == 1 end,
  {filter(IsEven, L), filter(IsOdd, L)}.