-module(chapter3_exercises).
-export([sum/1, sum/2, create/1, reverse_create/1, print_numbers/1, print_numbers_even/1]).


%% sum/1 functions %%

sum(Number) ->
	sum_a(Number, 0).

sum_a(0, Total) ->
	Total;
sum_a(Number, Total) ->
	sum_a(Number -1, Total + Number).


%% sum/2 functions %%

sum(Number1, Number2) ->

	case Number1 == Number2 of
		true -> Number1;	
		false ->
			sum_b(Number1, Number2, 0)
	end.

sum_b(Number, Number, Total) ->
	Total + Number;
sum_b(Number1, Number2, Total) ->
	sum_b(Number1 + 1, Number2, Total + Number1). 


%% create/1 functions %%

create(Number) ->
	create_exec(Number, []).

create_exec(0, List) ->
	List;
create_exec(Number, List) ->
	create_exec(Number - 1, [Number | List]).


%% create/1 functions %%

reverse_create(Number) ->
	reverse_create_exec(1, Number, []).

reverse_create_exec(Number, Number, List) ->
	[Number | List];
reverse_create_exec(Increment, Number, List) ->
	reverse_create_exec(Increment + 1, Number, [Increment |List]).


%% print number functions %%

print_numbers(EndNumber) ->
	List = create(EndNumber),
	io:format("Numbers: ~p~n",[List]).	

print_numbers_even(EndNumber) ->
	List = [ Number  || Number <- create(EndNumber), Number rem 2 == 0],
	io:format("Numbers: ~p~n",[List]).	
