%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 九月 2016 15:10
%%%-------------------------------------------------------------------
-module(ex8).
-author("Administrator").

%% API
-export([get_most_fun_module/0, get_most_pop_fun/0, get_no_ambiguous_fun/0]).

get_most_fun_module() ->
  ModList = code:all_loaded(),
  FuncNum = [{length(Mod:module_info(exports)), Mod} || {Mod, File} <- ModList],
  lists:max(FuncNum).

get_most_pop_fun() ->
  ModList = code:all_loaded(),
  FuncList = lists:flatten([Mod:module_info(exports) || {Mod, File} <- ModList]),
  FuncNameList = [FuncName || {FuncName, ArgNum} <- FuncList],
  FuncFreq = record_mapping:count_characters(FuncNameList),
  lists:max([{Num, Name} || Num <- maps:values(FuncFreq), Name <- maps:keys(FuncFreq)]).

get_no_ambiguous_fun() ->
  ModList = code:all_loaded(),
  FuncList = [Mod:module_info(exports) || {Mod, File} <- ModList],
  FuncFreqInModules = get_func_freq_in_modules(FuncList, #{}),
  [FuncName || FuncName <- maps:keys(FuncFreqInModules), maps:get(FuncName, FuncFreqInModules) =:= 1].

get_func_freq_in_modules([], X) ->
  X;
get_func_freq_in_modules([H | T], X) ->
  FuncNameList = [FuncName || {FuncName, ArgNum} <- H],
  FuncNameListUniq = lists:usort(FuncNameList),
  X2 = record_mapping:count_characters(FuncNameListUniq, X),
  get_func_freq_in_modules(T, X2).
