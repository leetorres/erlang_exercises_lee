-module(boolean).
-export([b_not/1, b_and/2, b_or/2, b_nand/2]).


%% Functions for b_not %%
b_not(Arg) ->

	case valid_arg(Arg) of
		true -> b_not_exec(Arg);
		false ->
			io:format("Invalid arguement, b_not/1 must input true or false~n",[])
	end.
		

b_not_exec(false) ->
	true;
b_not_exec(true) ->
	false.


%% Functions for b_and %%

b_and(Arg1, Arg2) ->

	case valid_arg(Arg1) and valid_arg(Arg2) of
		true -> b_and_exec(Arg1, Arg2);
		false ->
			io:format("Invalid arguements, b_and/2 must input true or false as arguments~n",[])
	end.

b_and_exec(true, true) ->
	true;
b_and_exec(true, false) ->
	false;
b_and_exec(false, true) ->
	false;
b_and_exec(false, false) ->
	false.


%% Functions for b_or %%

b_or(Arg1, Arg2) ->

	case valid_arg(Arg1) and valid_arg(Arg2) of
		true -> b_or_exec(Arg1, Arg2);
		false ->
			io:format("Invalid arguements, b_or/2 must input true or false as arguments~n",[])
	end.

b_or_exec(true, true) ->
	true;
b_or_exec(true, false) ->
	true;
b_or_exec(false, true) ->
	true;
b_or_exec(false, false) ->
	false.


%% Functions for b_nand %%

b_nand(Arg1, Arg2) ->

	case valid_arg(Arg1) and valid_arg(Arg2) of
		true -> b_nand_exec(Arg1, Arg2);
		false ->
			io:format("Invalid arguements, b_nand/2 must input true or false as arguments~n",[])
	end.


b_nand_exec(Arg1, Arg2) ->
	b_not(b_and(Arg1, Arg2)).


%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

%% Checks to see if an argument is an atom of true or false
valid_arg(Arg) ->
	case Arg of
		true -> true;
		false -> true;
		_Other -> false
	end.
