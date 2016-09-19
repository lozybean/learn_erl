%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 九月 2016 10:31
%%%-------------------------------------------------------------------
-module(try_test).
-author("Administrator").

%% API
-export([demo1/0, demo2/0]).

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).

demo1() ->
  [catcher(I) || I <- [1, 2, 3, 4, 5]].

catcher(N) ->
  try generate_exception(N) of Val ->
    {N, normal, Val}
  catch
    throw:X -> {N, caught, thrown, X};
    exit:X -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end.

demo2() ->
  [{I, (catch generate_exception(I))} || I <- [1, 2, 3, 4, 5]].