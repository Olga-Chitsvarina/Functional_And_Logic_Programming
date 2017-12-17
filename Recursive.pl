/* FAMILY TREE:
		Sonya	     Gerry
		 |            |
		Ana----------Jim			  Alice
			|				    |
		-----------------			    |
		|	|	|			    |
Sabrina---------Alex    Ben	Sasha----------------------Tom-----------
	   |		 |    			|		        |
	   |		 |    		-----------------		|
	   |		 |    		|	|	|		|
	Robert		Elizabeth	Max	Mary    Diane		Mike
*/

% FEMALES:
female(sonya).
female(ana).
female(alice).
female(sabrina).
female(sasha).
female(elizabeth).
female(mary).
female(diane).


% MALES:
male(gerry).
male(jim).
male(alex).
male(ben).
male(tom).
male(robert).
male(max).
male(mike).

% C HAS A PARENT B:
hasParent(ana, sonya).
hasParent(jim, gerry).
hasParent(alex, ana).
hasParent(alex, jim).
hasParent(ben, ana).
hasParent(ben, jim).
hasParent(sasha, ana).
hasParent(sasha, jim).
hasParent(tom, alice).
hasParent(robert,sabrina).
hasParent(robert, alex).
hasParent(elizabeth, ben).
hasParent(max,sasha).
hasParent(max, tom).
hasParent(mary,sasha).
hasParent(mary, tom).
hasParent(diane,sasha).
hasParent(diane, tom).
hasParent(mike, tom).



% A HAS a MOTHER B: 
hasMother(A,B) :- 
	hasParent(A,B),
	female(B).



% A HAS a FATHER B:
hasFather(A,B) :-
	hasParent(A,B),
	male(B).


% Child1 HAS a FULL SIBLING Child2:
hasFullSibling(Child1,Child2) :- 
	hasMother(Child1, Mother),
	hasMother(Child2, Mother),
	hasFather(Child1, Father),
	hasFather(Child2, Father),
	Child1 \= Child2. 


% Child1 HAS a HALF SIBLING Child2:
hasHalfSibling(Child1, Child2) :-
	hasParent(Child1, X),
	hasParent(Child2, X),
	Child1 \= Child2,
	\+ areFullSiblings(Child1,Child2).


% Child1 HAS A SISTER Child2, who is either half/full sibling
hasSister(Child1, Child2) :-
	(hasFullSibling(Child1, Child2);
	hasHalfSibling(Child1, Child2)),
	female(Child2).

% Child1 HAS A BROTHER Child2, who is either half/full sibling
hasBrother(Child1, Child2) :-
	(hasFullSibling(Child1, Child2);
	hasHalfSibling(Child1, Child2)),
	male(Child2).


% Child HAS AN AUNT PERSON
hasAunt(Child, Person) :-
	hasParent(Child, Parent),
	hasSister(Parent, Person).


% Child HAS AN UNCLE PERSON
hasUncle(Child, Person) :-
	hasParent(Child, Parent),
	hasBrother(Parent, Person).

% Child HAS A COUSINE PERSON?
hasCousine(Child, Person) :-
	hasParent(Child, Parent1),
	hasParent(Person, Parent2),
	(hasFullSibling(Parent1, Parent2);
	hasHalfSibling(Parent1, Parent2)).

% Child HAS A GRANDPARENT PERSON?
hasGrandParent(Child, Person) :-
	hasParent(Child, Parent),
	hasParent(Parent, Person).

	
% Child HAS AN ANCESTOR PERSON
hasAncestor(Child, Person) :- hasParent(Child, Person).
hasAncestor(Child, Person) :-	hasParent(Child, Parent),
				hasAncestor(Parent, Person).


%--------------------------------------------------------------

/*
                         City1
                    _____|   |____		
                City2           City7
                |                   |	
                City3           City8
                |   |               |
            City4___City5           |
                |   |               |
                City6_______________|

*/

rd(c1, c2).
rd(c1, c7).
rd(c2, c3).
rd(c3, c4).
rd(c3, c5).
rd(c4, c5).
rd(c4, c6).
rd(c5, c6).
rd(c6, c8).
rd(c7, c8).

road(C1, C2) :-
	( rd(C1, C2) ; rd(C2, C1) ).

get_path(C1, C2, Path) :-
	C1 == C2,
	Path = [].
	
get_path(C1, C2, Path) :-
	get_path(C1, C2, [], Path).
	
get_path(C1, C2, _, Path) :-
	road(C1, C2),
	Path = [C1, C2].
	
get_path(C1, C2, Visited, Path) :-
	road(C1, Other),
	\+ member(Other, Visited),
	\+ member(C2, Visited),
	NewVisited = [Other|Visited],
	get_path(Other, C2, NewVisited, PathC2_Other),
	\+ member(C1, PathC2_Other),
	Path = [C1| PathC2_Other].

%--------------------------------------------------------

/** Predicate count_to_100(X)
	It counts from X to 100 (either down or up) */
count_to_100(X):-
	X < 100,
	write(X),
	nl,
	Y is (X+1),
	count_to_100(Y).
	
count_to_100(X) :-
	X > 100,
	write(X),
	nl,
	Y is (X-1),
	count_to_100(Y).
	
count_to_100(X) :-
	write(X), !.
	
%---------------------------------------

/* Predicate count_from_to:
	It counts from N1 to N2 (either up or down) */
count_from_to(N1, N2) :-
	N1 < N2,
	write(N1),
	nl,
	NewN1 is N1 + 1,
	count_from_to(NewN1, N2).
	
count_from_to(N1, N2) :-
	N1 > N2,
	write(N1),
	nl,
	NewN1 is (N1 - 1),
	count_from_to(NewN1, N2).
	
count_from_to(N1,_) :-
	write(N1).	
	
%-------------------------------------------------

/* Calculates nth Fibonacci number using naive algorithm */ 
naive_fib(X, FibNumber) :-
	X == 0,
	FibNumber = 0.
	
naive_fib(X, FibNumber) :-
	X == 1,
	FibNumber = 1.
	
naive_fib(X, FibNumber) :-
	X > 1,
	Xminus1 is X - 1,
	Xminus2 is X - 2,
	naive_fib(Xminus1, FibXminus1),
	naive_fib(Xminus2, FibXminus2),
	FibNumber is FibXminus1 + FibXminus2.
	
%-------------------------------------------------------


/* Calculates the sum of numbers from 1 to and including Number */
sum_to(Number, Result) :-
	sum_to(Number, 1, 0, Result).

sum_to(Number, Count, CurrentResult, Result) :-
	Count > Number,
	Result = CurrentResult, !.
	
sum_to(Number, Count, CurrentResult, Result) :-
	NewCurrentResult is CurrentResult + Count,
	NewCount is Count + 1,
	sum_to(Number, NewCount, NewCurrentResult, Result).
	
	
	