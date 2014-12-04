-module(lists_b).
-export([filter/2, reverse/1, concatenate/1, flatten/1]).

filter(List, Limit) ->
	[ Number || Number  <- List, Number =< Limit ].

reverse(List) -> lists:reverse(List).

concatenate([])->
	[];
concatenate( [ Head | Tail] ) ->
	Head ++ concatenate(Tail).

flatten(List) ->
	lists:flatten(List)).
