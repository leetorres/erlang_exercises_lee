-module(chap7_exer).
-export([joe/0,foobar/1, perimeter/1, area/1]).
-export([create_circle/1, create_rectangle/2, create_triangle/3]).

%% Exercise 7-1
-record(person, {name, age=0, phone, address}).

%% Exercise 7-4
-record(circle, {radius}).
-record(rectangle, {length, width}).
-record(triangle, {side1, side2, side3}).


joe() ->
	#person{name="Joe", phone="999-999", address="No where"}.

%% Exercise 7-2
foobar(P) ->
	case is_record(P, person) of
		true ->
			io:format("Name: ~p~n", [P#person.name]);
		false ->
			io:format("Not a person record",[])
	end.


%% Exercise 7-4

create_circle(Radius) ->
	#circle{radius=Radius}.

create_rectangle(Length, Width) ->
	#rectangle{length=Length, width=Width}.

create_triangle(Side1, Side2, Side3) ->
	#triangle{side1=Side1, side2=Side2, side3=Side3}.

perimeter(Shape) when is_record( Shape, circle ) ->
	2 * math:pi() * Shape#circle.radius;
perimeter(Shape) when is_record(Shape, rectangle) ->
	2 * (Shape#rectangle.length + Shape#rectangle.width);	
perimeter(Shape) when is_record(Shape, triangle) ->
	Shape#triangle.side1 +  Shape#triangle.side2 + Shape#triangle.side3;
perimeter(_Shape) ->
	io:format("Not a valid shape record!~n",[]).

area(Shape) when is_record( Shape, circle) ->
	math:pi() * math:pow(Shape#circle.radius,2);
area(Shape) when is_record( Shape, rectangle) ->
	Shape#rectangle.length * Shape#rectangle.width;
area(Shape) when is_record( Shape, triangle) ->
	A = Shape#triangle.side1,
	B = Shape#triangle.side2,
	C = Shape#triangle.side3,
	S = (A + B + C)/2,
	math:sqrt(S*(S-A)*(S-B)*(S-C));
area(_Shape) ->
	io:format("Not a valid shape record!~n",[]).


%% Exercise 7-5

