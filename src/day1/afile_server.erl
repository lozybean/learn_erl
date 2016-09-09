%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 九月 2016 10:10
%%%-------------------------------------------------------------------
-module(afile_server).
-author("Administrator").

%% API
-export([start/1, loop/1]).

start(Dir) ->
  spawn(afile_server, loop, [Dir]).

loop(Dir) ->
  receive
    {Client, list_dir} ->
      Client ! {self(), file:list_dir(Dir)};
    {Client, {get_file, File}} ->
      Full = filename:join(Dir, File),
      Client ! {self(), file:read_file(Full)};
    {Client, {put_file, FileName, Content}} ->
      State = file:write_file(FileName, unicode:characters_to_binary(Content)),
      Client ! {self(), State}
  end,
  loop(Dir).