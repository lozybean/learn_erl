%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 九月 2016 9:40
%%%-------------------------------------------------------------------
-module(ex5).
-author("Administrator").

%% API
-export([map_search_pred/2]).

map_search_pred(Map, Pred) ->
  Keys = maps:keys(Map),
  Values = maps:values(Map),
  map_search_pred(Keys, Values, Pred).

map_search_pred([HK | TK], [HV | TV], Pred) ->
  case Pred(HK) =:= HV of
    true -> {HK, HV};
    false -> map_search_pred(TK, TV, Pred)
  end;
map_search_pred([], [], Pred) ->
  find_nothing.

