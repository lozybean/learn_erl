%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 九月 2016 10:50
%%%-------------------------------------------------------------------
-module(myfile).
-author("Administrator").

%% API
-export([read/1]).

read(File) ->
  {Status, Content} = file:read_file(File),
  case Status of
    ok -> Content;
    error -> throw(Content)
  end.
