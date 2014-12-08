-module(binary_tree).
-record(node, {value, left=null, right=null}).
-export([create_ordered_binary_tree/1, sum_of_tree/1, max_value_of_tree/1, insert_node_ordered/2]).



%=============================================================================
% API - functions 
%=============================================================================

%% Arg is a  list of integers that will be converted into an ordered binary tree
create_ordered_binary_tree([Head | Tail]) ->
	Root = create_node(Head),
	create_ordered_binary_tree(Root, Tail).

create_ordered_binary_tree(Root, []) ->
	Root;
create_ordered_binary_tree(Root, [Head | Tail]) ->
	InsertedNode = insert_node_ordered(Root, Head),
	create_ordered_binary_tree(InsertedNode, Tail).



%% Arg is the Rootnode/Tree
%% Returns the sum value of the tree
sum_of_tree(CurrentNode) ->

	case  { free_leaf(CurrentNode#node.left), free_leaf(CurrentNode#node.right) } of
		{ true,  true } -> 
			CurrentNode#node.value;
		{ true , false } ->
			CurrentNode#node.value + sum_of_tree( CurrentNode#node.right );
		{ false, true } ->
			CurrentNode#node.value + sum_of_tree( CurrentNode#node.left );
		{ false, false } ->
			CurrentNode#node.value + ( sum_of_tree( CurrentNode#node.left ) + sum_of_tree( CurrentNode#node.right ) )
	end.


%% Arg is the Rootnode/Tree
%% Returns the max value of the tree
max_value_of_tree(RootNode) ->
	max_value_of_tree(RootNode, RootNode#node.value).

max_value_of_tree(#node{ left = null, right = null } = CurrentNode, MaxValue) ->
	max_number(CurrentNode#node.value, MaxValue);	
max_value_of_tree(#node{ right = null } = CurrentNode, MaxValue) ->
	max_number(CurrentNode#node.value, 
		max_value_of_tree(CurrentNode#node.left, MaxValue));
max_value_of_tree(#node{ left = null } = CurrentNode, MaxValue) ->
	max_number(CurrentNode#node.value, 
		max_value_of_tree(CurrentNode#node.right, MaxValue));
max_value_of_tree(CurrentNode, MaxValue) ->
	max_number(CurrentNode#node.value, 
		max_number( max_value_of_tree(CurrentNode#node.left, MaxValue), 
		max_value_of_tree(CurrentNode#node.right, MaxValue))).

%% Arg is the Rootnode/Tree, and the Value to insert
%% Returns a tree with the value inserted
insert_node_ordered(CurrentNode, Value) ->

	case Value =< CurrentNode#node.value of

		true ->
		
			case CurrentNode#node.left of
			
				null -> 	
					Node = create_node(Value),
					CurrentNode#node{left = Node}; 
				_LeftLeafExists ->
					CurrentNode#node{left = insert_node_ordered(
						CurrentNode#node.left, Value)}
			end;

		false ->

			case CurrentNode#node.right of

				null ->
					
					Node = create_node(Value),
					CurrentNode#node{right = Node};
				_RightLeafExists ->
					CurrentNode#node{right = insert_node_ordered(
						CurrentNode#node.right, Value)}

			end
	end.





%=============================================================================
% Internal Functions 
%=============================================================================


create_node(Value) ->
	#node{value=Value}.

max_number(Value1, Value2) ->

	case Value1 >= Value2 of
		true -> Value1;
		false -> Value2
	end.

free_leaf(CurrentNode) ->

	case CurrentNode of

		null -> true;
		_OccupiedLeaf -> false

	end.
