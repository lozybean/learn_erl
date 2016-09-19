%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 九月 2016 9:24
%%%-------------------------------------------------------------------
-module(ex7_tests).
-author("Administrator").

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
  ?assert(true).

reverse_byteorder_test() ->
  Byte = <<"hello">>,
  ReverseByte = <<"olleh">>,
  ?assertEqual(ReverseByte, ex7:reverse_byteorder(Byte)).

reverse_bitorder_test() ->
  Bit = <<2#10011:5>>,
  ReverseBit = <<1, 1, 0, 0, 1>>,
  ?assertEqual(ReverseBit, ex7:reverse_bitorder(Bit)).


term_to_packet_test() ->
  Term = "hello",
  Packet = <<0, 0, 0, 9, 131, 107, 0, 5, 104, 101, 108, 108, 111>>,
  ?assertEqual(Packet, ex7:term_to_packet(Term)).

packet_to_term_test() ->
  Packet = <<0, 0, 0, 9, 131, 107, 0, 5, 104, 101, 108, 108, 111>>,
  Term = "hello",
  ?assertEqual(Term, ex7:packet_to_term(Packet)).