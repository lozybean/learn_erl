%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 九月 2016 13:14
%%%-------------------------------------------------------------------
-module(test1).
-author("Administrator").

%% API
-export([f1/0]).

f1() ->
  X = erlang:time(),
  seconds(X).

seconds({_Year, _Month, _Day, Hour, Min, Sec}) ->
  (Hour * 60 + Min) * 60 + Sec.
