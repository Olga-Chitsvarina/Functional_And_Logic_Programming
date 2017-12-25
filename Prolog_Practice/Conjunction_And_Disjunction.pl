/*	Predicates 'number_is(X)':
		simulate different cases:
		if number is Positive, it will print "Number is positive",
		if number is Equal to Zero, it will print "Number is equal to zero",
		otherwise , it will print "Number is negative".
	*/
number_is(X) :-
	Y is 0,
	X > Y,
	write('Number is positive').

number_is(X) :-
	Y is 0,
	X =:= Y,
	write('Number is equal to zero').
	
number_is(X) :-
	Y is 0,
	X < Y,
	write('Number is negative').
	
%----------------------------------------------------------------------------

/* 	Predicates 'number_is_valid(X)' does the following:
		- if number is strictly less than or strictly greater than 0,
		  it will print that the number is valid, it also uses cut after
		- otherwise, it will print that the number is invalid.
	*/
number_is_valid(X) :-
	Y = 0,
	(X > Y ; X < Y),
	write('Number is valid'),!.
	
number_is_valid(_) :-
	write('Number is invalid').
	Co
