%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 九月 2016 9:19
%%%-------------------------------------------------------------------
-module(math_functions_tests).
-author("Administrator").

%% API
-export([]).
-include_lib("eunit/include/eunit.hrl").

even_test() ->
  ?assertEqual(false, math_functions:even(1)),
  ?assertEqual(true, math_functions:even(2)).

odd_test() ->
  ?assertEqual(false, math_functions:odd(2)),
  ?assertEqual(true, math_functions:odd(1)).

filter_test() ->
  F = fun(X) -> X rem 2 == 0 end,
  L = [1, 2, 3, 4, 5, 6, 7, 8],
  ?assertEqual([2, 4, 6, 8], math_functions:filter(F, L)).

split_test() ->
  L = [1, 2, 3, 4, 5, 6, 7, 8],
  ?assertEqual({[2, 4, 6, 8], [1, 3, 5, 7]}, math_functions:split(L)).
split1_test() ->
  L = [1, 2, 3, 4, 5, 6, 7, 8],
  ?assertEqual({[2, 4, 6, 8], [1, 3, 5, 7]}, math_functions:split(L)).
split2_test() ->
  L = [1, 2, 3, 4, 5, 6, 7, 8],
  ?assertEqual({[2, 4, 6, 8], [1, 3, 5, 7]}, math_functions:split(L)).