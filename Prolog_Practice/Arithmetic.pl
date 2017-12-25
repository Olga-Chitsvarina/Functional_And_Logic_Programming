
/* Performs N1 - N2.*/
subtract_operation(N1, N2, Result) :-
	Result is (N1 - N2).
	
/* Performs N1+N2. */	
sum_operation(N1, N2, Result) :-
	Result is (N1 + N2).
	
/* Performs N1*N2 */
mult_operation(N1, N2, Result) :-
	Result is (N1 * N2).
	
/* Performs N1 / N2 
	Example 5/2 -> 2.5*/
div_operation(N1, N2, Result) :-
	Result is (N1/N2).

/* 	Performs N1 // N2 
	Example 5//2 -> 2.*/
div_int_operation(N1,N2, Result) :-
	Result is (N1 // N2).

/*Returns true if numbers are equal*/	
are_equal(N1, N2) :-
	N1 =:= N2.

/* Returns true if numbers are not equal */	
not_equal(N1, N2) :-
	\+ (N1 == N2).

/* Returns true if numbers are not equal*/	
not_equal_second(N1, N2) :-
	N1 =\= N2.

/* Returns true if N1 is less than or equal to N2. */	
less_than_or_eq(N1, N2) :-
	N1 =< N2.

/* Returns true if N1 is greater than or equal to N2 */	
greater_than_or_eq(N1, N2) :-
	N1 >= N2.
	
/* Returns Number^Power as a decimal number. 
	Example: 
	5^3  -> 125*/	
power_operation(Number, Power, Result) :-
	Result is (Number^Power).
	
/* Returns Number^Power as a floating point number. 
	Example:
	5**3 -> 125.0
	*/
power_operation_second(Number, Power, Result) :-
	Result is (Number ** Power).
	
/* Returns sqrt of Number */	
sqrt_operation(Number, Result) :-
	Result is (sqrt(Number)).
	
/* Modulus operation: */
mod_operation(N1, N2, Result):-
	Result is mod(N1, N2).
	
/* Returns the absolute value of Number */
abs_operation(N1, Result) :-
	Result is abs(N1).
	
/* Stores max of N1 and N2 in Result */	
max_number(N1, N2, Result) :-
	Result is max(N1, N2).
	
/* It either rounds the float point value of the number up or down 
	Example:
	5.0 -> 5
	5.2 -> 5
	5.5 -> 5
	5.6 -> 6
	*/
round_operation(N1, Result) :-
	Result is round(N1).
	
/* 	This will return the truncated value of the number 
	Example: 
	5.0 -> 5
	5.2 -> 5
	5.6 -> 5*/
truncate_operation(N1, Result) :-
	Result is truncate(N1).
	
/* This will always round the number down */
floor_operation(N1, Result) :-
	Result is floor(N1).
	
	
/* This will always round the number up */
ceiling_operation(N1, Result) :-
	Result is ceiling(N1).
	
%-------------------------------------------------------

/* Decides whether or not the number is Prime */
isPrime(PresumablyPrime) :-
	isPrime(PresumablyPrime, 2).

isPrime(PresumablyPrime, Divisor) :-
	PresumablyPrime < Divisor,
	PresumablyPrime > 0, !.
	
isPrime(PresumablyPrime, Divisor) :-
	ModResult is mod(PresumablyPrime, Divisor),
	ModResult == 0,
	PresumablyPrime == Divisor, !.
	
isPrime(PresumablyPrime, Divisor) :-
	ModResult is mod(PresumablyPrime, Divisor),
	ModResult \= 0,
	NewDivisor is Divisor + 1,
	isPrime(PresumablyPrime, NewDivisor).
	
%-----------------------------------------------------------

/* Construct a list of prime numbers in given range. */
construct_list_in_given_range(Low, High, Result) :-
	construct_list_in_given_range(Low, High, [], Result).

construct_list_in_given_range(Low, High, ObtainedList, Result) :-
	Low > High,
	Result = ObtainedList.

construct_list_in_given_range(Low, High, ObtainedList, Result) :-
	Low =< High,
	append(ObtainedList, [Low], NewObtainedList),
	NewLow is Low + 1,
	construct_list_in_given_range(NewLow, High, NewObtainedList, Result).
	

prime_in_range(Low, High, ResultedList) :-
	construct_list_in_given_range(Low, High, ListOfAllNumbersInThatRange),
	findall(X, ( member(X, ListOfAllNumbersInThatRange), isPrime(X) ), ResultedList).
	
%-----------------------------------------------------------

/* Find the Greatest Common Factor of two numbers */
find_gcf(N1, N2, GCF) :-
	find_gcf(N1, N2, 1, 1, GCF), !.

find_gcf(N1, N2, Count, GCF, Result) :-
	(Count > N1; Count > N2),
	Result = GCF, !.

find_gcf(N1, N2, Count, _, Result) :-
	Mod1 is mod(N1, Count),
	Mod2 is mod(N2, Count),
	Mod1 == 0,
	Mod2 == 0,
	NewGCF = Count,
	NewCount is Count + 1,
	find_gcf(N1, N2, NewCount, NewGCF, Result).
	
find_gcf(N1, N2, Count, GCF, Result) :-
	Mod1 is mod(N1, Count),
	Mod2 is mod(N2, Count),
	(Mod1 \= 0 ; Mod2 \= 0),
	NewCount is Count + 1,
	find_gcf(N1, N2, NewCount, GCF, Result).
	
%-----------------------------------------------------------

my_append([],[],[]).
my_append([], X, X).
my_append(Y, [], Y).
my_append(X, Y, ObtainedList) :-
	reverse(X, ReversedX),
	ReversedX = [H|Tail],
	NewY = [H|Y],
	reverse(ReversedX, ReversedBackX),
	my_append(ReversedBackX, NewY, ObtainedList).
	
	
