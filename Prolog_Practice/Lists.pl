/* Returns the length of the list */
get_length(List, Result) :-
	length(List, Result).
	
/* Returns the first element of the list */
get_head(List, Head) :-
	List = [Head|_].
	
/* Returns the last element of the list */
get_last(_, Last) :-
	last(_, Last).
	
/* Adds 2 elements at the beginning of the list */
add_at_the_beginning(E1, E2, List, Result) :-
	Result = [E1, E2| List].
	
/* Adds two elements to the end of the list */
add_at_the_end(E1, E2, List, Result) :-
	append(List, [E1, E2], Result).
	
/* Removes duplicates and sorts the list */
remove_duplicates_and_sort(List, Result) :-
	sort(List, Result).
	
/* List all the members of the list */
list_members(List, Element) :-
	member(Element, List).
	
/* Returns a sublist of length 2 of the list */
list_sublist(List, Sublist) :-
	sublist([A,B], List),
	Sublist = [A,B].
	
/* Reverses the list */
reverse_list(List, Result):-
	reverse(List, Result).
	
/* Returns nth element from the list */
return_nth(Index, List, Element):-
	nth(Index, List, Element).
	
/* Returns the max element from the list */
return_max(List, Max) :-
	max_list(List, Max).
%-----------------------------------------------------

/* This predicate:
	1) Returns the first element from the list if index is 0.
	2) Returns the nth-1 element from the list if index is > 0.
	3) Returns the nth element from the end of the list if index < 0. 
	*/
find_nth(List, 0, ElementAtIndex) :-
	List = [ElementAtIndex|_].

find_nth(List, Index, ElementAtIndex):-
	Index > 0,
	List = [_|Tail],
	NewIndex is Index -1,
	find_nth(Tail, NewIndex, ElementAtIndex).
	
find_nth(List, Index, ElementAtIndex) :-
	Index < 0,
	NewIndex is Index + 1,
	AbsNewIndex is abs(NewIndex),
	reverse(List, NewList),
	find_nth(NewList, AbsNewIndex, ElementAtIndex).
	
%--------------------------------------------------------

/* Finds the last element of the list */
find_last([Element|[]], Element).
find_last(List, Element) :-
	List = [_|Tail],
	find_last(Tail,Element).
	
/* Finds the length of the list */
find_length([], 0).
find_length([_|Tail], Result) :-
	find_length(Tail, ReturnedNumber),
	Result is (1 + ReturnedNumber).

%--------------------------------------------------------------------
	
/* Reverse a list */
reverse_a_list(List, Result):-
	find_reversed(List, [], Result).

find_reversed([], NewList, NewList).
	
find_reversed(List, NewList, ResultedList) :-
	append(RemovedLast, [Last], List),
	append(NewList, [Last], ModifiedNewList),
	find_reversed(RemovedLast, ModifiedNewList, ResultedList).

%--------------------------------------------------------------------
	
/*Eliminate consecutive duplicates of elements in the list */
eliminate_duplicates_from_a_list(List, Result):-
	eliminate_duplicates(List, [], Result).

eliminate_duplicates([], NewList, NewList).

eliminate_duplicates([A], NewList, ResultedList):-
	append(NewList, [A], ResultedList),!.

eliminate_duplicates(List, NewList, ResultedList) :-
		List = [First, Second|Tail],
		First == Second,
		eliminate_duplicates([First|Tail], NewList, ResultedList).
		
eliminate_duplicates(List, NewList, ResultedList) :-
		List = [First, Second|Tail],
		First \= Second,
		append(NewList, [First], ModifiedNewList),
		eliminate_duplicates([Second|Tail], ModifiedNewList, ResultedList).

%--------------------------------------------------------------------

/* Returns true if list is a palindrome */
is_a_palindrome([]).
	
is_a_palindrome([_|[]]).
		
is_a_palindrome(List) :-
	List = [Head|Tail],
	append(RemovedLast, [Last], Tail),
	Head == Last,
	is_a_palindrome(RemovedLast).
	
%--------------------------------------------------------------------
	
/* Duplicate the elements of the list */
duplicate_elements_in_the_list(List, ResultedList) :-
	duplicate(List, [], ResultedList).

duplicate([], NewList, ResultedList):-
	ResultedList = NewList.
		
duplicate(List, NewList, ResultedList):-
	List = [H|T],
	add_at_the_end(H, H, NewList, NewNewList),
	duplicate(T, NewNewList, ResultedList).
	
%---------------------------------------------------------------------
/* Removes Kth element from the list */
remove_kth(List, K, ResultedList) :-
	remove_kth(List, K, 1, [], ResultedList).

remove_kth([], _, _, NewList, NewList).

remove_kth(List, K, Count, NewList, ResultedList) :-
	Count == K,
	List = [_|T],
	append(NewList, T, ResultedList), !.
	
remove_kth(List, K, Count, NewList, ResultedList) :-
	NewCount is (Count + 1),
	List = [H|T],
	append(NewList, [H], NewNewList),
	remove_kth(T, K, NewCount, NewNewList, ResultedList).
	
%---------------------------------------------------------------------

/* Returns all lists, which contain element as sublists of one big list */
my_list([]).
my_list([-1]).
my_list([1,2,3]).
my_list([abc, 1,2,3,4, efg]).
my_list([klm, prst, [n,o], 1,2,3]).

containsElement(Element, ResultedList):-
	findall(X, (my_list(X), member(Element,X)), ResultedList).
	
	
%-----------------------------------------------------------

/* Implementation of append rule */
my_append([], X, X).
my_append(X, Y, ObtainedList) :-
	reverse(X, ReversedX),
	ReversedX = [H|Tail],
	NewY = [H|Y],
	reverse(Tail, ReversedBackX),
	my_append(ReversedBackX, NewY, ObtainedList).

%-----------------------------------------------------------

/* Sum of Line 1 = Sum of Line 2 = Sum of Line 3
Each line has 4 elements, so that 
Line 1 shares one element with Line 2
Line 1 shares one element with Line 3
Line 2 shares one element with Line 1
Line 2 shares one element with Line 3
Line 3 shares one element with Line 1
Line 3 shares one element with Line 2
Elements in each line are distinct
Finds all the combinations, so that sum is minimal.
Finds all the combinations, so that summ is maximal.
List has 9 distincs elements. */

construct_lines(List, Line1, Line2, Line3, Sum) :-
	sublist([X, Y, Z], List),
	
	subtract(List, [X, Y, Z], RemovedXYZ),
	
	sublist([E1, E2], RemovedXYZ),
	subtract(RemovedXYZ, [E1, E2], RemovedXYZ1),
	
	sublist([E3, E4], RemovedXYZ1),
	subtract(RemovedXYZ1, [E3, E4], RemovedXYZ12),
	
	RemovedXYZ12 = [E5, E6],
	
	Line1 = [X, E1, E2, Y],
	Line2 = [Y, E3, E4, Z],
	Line3 = [Z, E5, E6, X],
	
	Sum is X + E1 + E2 + Y,
	Sum =:= Y + E3 + E4 + Z,
	Sum =:= Z + E5 + E6 + X.
	
find_min_sum(ListNumbers, MinSumResult) :-
	findall(Sum, construct_lines(ListNumbers, L1, L2, L3, Sum), MinSumList),
	min_list(MinSumList, MinSum),
	
	findall(result(MinSum, L1, L2, L3), construct_lines(ListNumbers, L1, L2, L3, MinSum), MinSumResult).

find_max_sum(ListNumbers, MaxSumResult) :-
	findall(Sum, construct_lines(ListNumbers, L1, L2, L3, Sum), MaxSumList),
	max_list(MaxSumList, MaxSum),
	
	findall(result(MaxSum, L1, L2, L3), construct_lines(ListNumbers, L1, L2, L3, MaxSum), MaxSumResult).	

%----------------------------------------------------------------------------------------------
	
/* Count occurrences of X in the List */

count_occurrences(X, List, CountResult) :-
	count_occurrences(X, List, 0, CountResult).

count_occurrences(_, [], CurrentCount, CountResult) :-
	CountResult = CurrentCount.

count_occurrences(X, List, CurrentCount, CountResult) :-
	List = [H|Tail],
	H == X,
	NewCurrentCount is CurrentCount + 1,
	count_occurrences(X, Tail, NewCurrentCount, CountResult).
	
count_occurrences(X, List, CurrentCount, CountResult) :-
	List = [H|Tail],
	H \= X,
	count_occurrences(X, Tail, CurrentCount, CountResult).
	
%-----------------------------------------------------------
