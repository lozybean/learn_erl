%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 九月 2016 9:54
%%%-------------------------------------------------------------------
-module(ex5_tests).
-author("Administrator").

-include_lib("eunit/include/eunit.hrl").

map_search_pred_test() ->
  Map = #{a => 1, f => 9, b => 3, r => 2, g => 4, aa => 3},
  Pred1 = fun(X) -> X > 10 end,
  Pred2 = fun(X) -> 3 end,
  ?assertEqual(find_nothing, ex5:map_search_pred(Map, Pred1)),
  ?assertEqual({aa, 3}, ex5:map_search_pred(Map, Pred2)).