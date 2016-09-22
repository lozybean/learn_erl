%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 九月 2016 10:55
%%%-------------------------------------------------------------------
-module(ex12_1).
-author("Administrator").

%% API
-export([start/2]).

start(AnAtom, Fun) ->
  Pid = spawn(Fun),
  register(AnAtom, Pid).