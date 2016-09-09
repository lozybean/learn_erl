%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 九月 2016 10:24
%%%-------------------------------------------------------------------
-module(afile_client).
-author("Administrator").

%% API
-export([ls/1, get_file/2, put_file/3]).

ls(Server) ->
  Server ! {self(), list_dir},
  receive
    {Server, FileList} ->
      FileList
  end.

get_file(Server, File) ->
  Server ! {self(), {get_file, File}},
  receive
    {Server, Content} ->
      Content
  end.

put_file(Server, FileName, Content) ->
  Server ! {self(), {put_file, FileName, Content}},
  receive
    {Server, State} ->
      State
  end.

