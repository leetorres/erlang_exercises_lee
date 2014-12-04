-module(db).
-export([new/0, destroy/0, write/3, delete/2, read/2, match/2]).

new() ->
	[].

destroy() ->
	ok.

write(Key, Element, Db) ->
	[{Key, Element}] ++ Db.

%% Deleting a tuple %%
delete(Key, Db) ->
	delete_exec(Key, Db, []).

delete_exec(_Key, [], NewDb) ->
	NewDb;
delete_exec(Key, [{Key, _City } | Tail], NewDb) ->
	NewDb ++ Tail;
delete_exec(Key, [ Head | Tail  ], NewDb) ->
	delete_exec(Key, Tail, [Head | NewDb ]).

%delete(_Key, []) ->
%	[];
%delete(Key, [{Key, _City} | Tail]) ->
%	Tail;
%delete(Key, [ Head | Tail]) ->
%	[Head | delete(Key, Tail) ].	
	

%% Read a person's key and return their city %%
read( _Key, []  ) ->
	{error, instance};
read(Key, [ {Key, City   } | _Tail ]) ->
	{ok, City};
read(Key, [{ _Key, _City } | Tail ]) ->
	read(Key, Tail).


%% Match the people who belong to a city %%

match(_Key, []) ->
	[];
match(Element, [ {Key, Element} | Tail ]) ->
	[Key | match(Element, Tail)];
match(Element, [ {_Key, _Element2} | Tail]) ->
	match(Element, Tail).


%match(Element, Db) ->
%	match_exec(Element, Db, []).
	
%match_exec(_Element, [], Results) ->
%	Results;
%match_exec(Element, [ {Key, Element } | Tail ], Results ) ->
%	match_exec(Element, Tail, [Key | Results]);
%match_exec(Element, [ {_Key, _Element2} | Tail ], Results) ->
%	match_exec(Element, Tail, Results).


