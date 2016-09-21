%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 九月 2016 13:33
%%%-------------------------------------------------------------------
-module(test3).
-author("Administrator").

%% API
-export([]).

test() -> factorial(-5).

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).