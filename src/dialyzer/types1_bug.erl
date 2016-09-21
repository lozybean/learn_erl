%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 九月 2016 13:57
%%%-------------------------------------------------------------------
-module(types1_bug).
-author("Administrator").

%% API
-export([f4/1]).

f4({H, M, S}) when is_float(H) ->
  print(H, M, S),
  (H + M * 60) * 60 + S.

print(H, M, S) ->
  Str = integer_to_list(H) ++ ":" ++ integer_to_list(M) ++ ":" ++ integer_to_list(S),
  io:format("~s", [Str]).