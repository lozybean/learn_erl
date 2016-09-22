%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 九月 2016 14:50
%%%-------------------------------------------------------------------
-module(area_server1).
-author("Administrator").

%% API
-export([rpc/2, loop/0]).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

loop() ->
  receive
    {From, Args} ->
      From ! {self(), geometry:area(Args)},
      loop()
  end.