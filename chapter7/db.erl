-module(db).
-export([new/0, destroy/0, write/3, delete/2, read/2, match/2]).

-record(data, {key, data}).

new() ->
	[].

destroy() ->
	ok.

write(Key, Element, Db) ->
	[#data{key=Key, data = Element}] ++ Db.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Deleting a tuple  %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%delete(Key, Db) ->
%	delete_exec(Key, Db, []).

%delete_exec(_Key, [], NewDb) ->
%	NewDb;
%delete_exec(Key, [ #data{key=Key} | Tail], NewDb) ->
%	NewDb ++ Tail;
%delete_exec(Key, [ Head | Tail  ], NewDb) ->
%	delete_exec(Key, Tail, [Head | NewDb ]).

delete(_Key, []) ->
	[];
delete(Key, [ #data{key = Key} | Tail]) ->
	Tail;
delete(Key, [ Head | Tail]) ->
	[Head | delete(Key, Tail) ].	


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Deleting a tuple  %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


read( _Key, []  ) ->
	{error, instance};
read(Key, [ Head | _Tail ]) when Head#data.key==Key ->
	{ok, Head#data.data};
read(Key, [ _Head | Tail ]) ->
	read(Key, Tail).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Matching a tuple  %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

match(_Element, []) ->
	[];
match(Element, [ Head | Tail]) when Head#data.data == Element ->
	[Head#data.key | match(Element, Tail)];
match(Element, [ _Head | Tail ]) ->
	match(Element, Tail).

%% Match the people who belong to a city %%
%match(Element, Db) ->
%	match_exec(Element, Db, []).
	
%match_exec(_Element, [], Results) ->
%	Results;
%match_exec(Element, [ {Key, Element } | Tail ], Results ) ->
%	match_exec(Element, Tail, [Key | Results]);
%match_exec(Element, [ {_Key, _Element2} | Tail ], Results) ->
%	match_exec(Element, Tail, Results).



