%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 九月 2016 15:06
%%%-------------------------------------------------------------------
-module(area_server_final).
-author("Administrator").

%% API
-export([start/0, area/2]).

start() -> spawn(area_server1, loop, []).

area(Pid, What) ->
  area_server1:rpc(Pid, What).
