-module(chapter9_exercises).
-export([print_numbers/1, print_even_numbers/1, concatenate/1, sum_of_integers/1,
				 divisible_by_three/1, remove_non_integers/1, intersection/2, symetric_difference/2,
				 zip/2, zipWith/3,
			   all/2, any/2, append/1]).

%% Exercise 9-1

print_numbers( End ) ->
	List = lists:seq(1, End),
	lists:map( fun(X) -> io:format("~p~n", [X]) end, List),
	ok.

print_even_numbers(End) ->
	List = lists:seq(1, End),
	FilteredList = lists:filter( fun(X) -> X rem 2 == 0 end, List),
	lists:map( fun(X) -> io:format("~p~n", [X]) end, FilteredList),
	ok.

concatenate(List) ->
	lists:foldl( fun(NewElement, CurrentList) ->  CurrentList ++ NewElement end, [], List).

sum_of_integers(List) ->
	lists:foldl( fun( Number, Sum ) -> Number + Sum end, 0, List).


%% Exercise 9-2

divisible_by_three(End) when End > 10 ->
	{error, "arg greater than 10, must be between 1-10" };
divisible_by_three(End) when End < 0 ->
	{error, "arg less than 0, must be between 1-10" };
divisible_by_three(End) ->
	List = lists:seq(1, End),
	[ Number || Number <- List, Number rem 3 == 0].
	
		
remove_non_integers(List) ->
	[ Number * Number || Number <- List, is_integer(Number) ].

intersection(List1, List2) ->
	[ Number1 || Number1 <- List1, Number2 <- List2, Number1 == Number2 ].

symetric_difference(List1, List2) ->
	Concat = concatenate([List1, List2]),
	Intersection = intersection(List1, List2), 
	[Number  ||  Number <- Concat ,not lists:member(Number, Intersection) ].


%% Exercise 9-3
zip(List1, List2) ->
	zip(List1, List2, []).

zip([],[], Acc) ->
	Acc;
zip(_List1,[], Acc) ->
	Acc;
zip( [], _List2, Acc) ->
	Acc;
zip([Num1 | Tail1], [Num2 | Tail2], Acc) ->
	[{Num1,Num2} | zip(Tail1, Tail2, Acc)].

zipWith( Func, List1, List2) -> 
	PreList = zip(List1, List2),
	[ Func(Num1,Num2) || {Num1, Num2} <- PreList ]. 


%% Exercise 9-4
all(Func, List) ->
	Result = lists:dropwhile(Func, List),
	Result == [].	

any(Func, List) ->
	Result = lists:dropwhile( fun(X) -> not Func(X) end, List),
	Result /= [].

append(ListOfLists) ->
	[ Elem || List <- ListOfLists, Elem <- List ].
