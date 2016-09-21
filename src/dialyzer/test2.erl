%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 九月 2016 13:31
%%%-------------------------------------------------------------------
-module(test2).
-author("Administrator").

%% API
-export([f1/0]).

f1() ->
  tuple_size(list_to_tuple({a, b, c})).