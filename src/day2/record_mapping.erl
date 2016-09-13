%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 九月 2016 15:40
%%%-------------------------------------------------------------------
-module(record_mapping).
-author("Administrator").

%% API
-export([count_characters/1]).

count_characters(Str) ->
  count_characters(Str, #{}).


count_characters([H | T], X) ->
  case maps:is_key(H, X) of
    true ->
      #{H:=N} = X,
      count_characters(T, X#{H:=N + 1});
    false ->
      count_characters(T, X#{H=>1})
  end;
count_characters([], X) ->
  X.