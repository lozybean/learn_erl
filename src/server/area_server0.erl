%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 九月 2016 11:14
%%%-------------------------------------------------------------------
-module(area_server0).
-author("Administrator").

%% API
-export([loop/0]).

loop() ->
  receive
    Args ->
      Shape = element(1, Args),
      io:format("Area of ~w is ~p~n", [Shape, geometry:area(Args)]),
      loop()
  end.