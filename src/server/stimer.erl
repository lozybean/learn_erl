%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 九月 2016 10:04
%%%-------------------------------------------------------------------
-module(stimer).
-author("Administrator").

%% API
-export([start/2, cancel/1, timer/2]).

start(Time, Fun) -> spawn(?MODULE, timer, [Time, Fun]).
cancel(Pid) -> Pid ! cancel.
timer(Time, Fun) ->
  receive
    cancel ->
      void
  after Time ->
    Fun()
  end.