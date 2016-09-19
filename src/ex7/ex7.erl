%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 九月 2016 9:03
%%%-------------------------------------------------------------------
-module(ex7).
-author("Administrator").

%% API
-export([reverse_byteorder/1, reverse_bitorder/1, term_to_packet/1, packet_to_term/1]).

reverse_byteorder(Byte) ->
  ByteList = [X || <<X:8>> <= Byte],
  list_to_binary(lists:reverse(ByteList)).

term_to_packet(Term) ->
  Data = term_to_binary(Term),
  N = byte_size(Data),
  <<N:32, Data/binary>>.

packet_to_term(Packet) ->
  <<N:32, Data/binary>> = Packet,
  binary_to_term(Data).

reverse_bitorder(Byte) ->
  BitList = [X || <<X:1>> <= Byte],
  list_to_bitstring(lists:reverse(BitList)).