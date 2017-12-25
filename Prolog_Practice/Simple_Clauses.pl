%
% Ben has a book.
% Ben has a pen.
% Sam has a book.
% Sam has a ruler.
%
has(ben,book).
has(ben,pen).
has(sam,book).
has(sam,ruler).

%
% Mary has a binder and a pencil.
%
hasObjects(mary,binder,pencil).


%
% Pen is red. 
% Book is red.
%
isRed(pen).
isRed(book).

%
% Binder is blue.
% Pencil is blue.
%
isBlue(binder).
isBlue(pencil).
isBlue(ruler).


%
% Ben likes anything what is red.
%
likes_obj(ben,X) :- isRed(X).


%
% Sam likes anything what is blue and he has it.
%
likes_obj(sam,X) :- 
	isBlue(X), 
	has(sam,X).

	
%-----------------------------------------------------

/* List of males */
male(genry).
male(benjamin).
male(alex).
male(tom).

/* List of females*/
female(elizabeth).
female(victoria).
female(ana).
female(alice).

/* List what these people like */
likes(genry,reading).
likes(genry,dancing).
likes(genry,singing).
likes(genry,elizabeth).
likes(elizabeth,reading).
likes(elizabeth,dancing).
likes(elizabeth,singing).
likes(elizabeth,genry).
likes(benjamin,reading).
likes(benjamin,sport).
likes(benjamin, programming).
likes(benjamin, victoria).
likes(victoria, singing).
likes(victoria, dancing).
likes(victoria, music).
likes(victoria, genry).
likes(alex, sport).
likes(ana, music).
likes(ana, alex).
likes(tom, reading).
likes(tom, dancing).
likes(tom, singing).
likes(tom, sport).
likes(tom, programming).
likes(alice, food).
likes(alice, programming).

/* List people, who do not like each other*/
enemies(victoria, benjamin).
enemies(alice, tom).
enemies(gerry, tom).

/* Say that 2 people are friends, 
	-	if they are of the same gender,  and they like doing the same thing,
		and do not hate each other
	- 	if they are of opposite gender, they like doing the same thing,
		do not hate or like each other.
	*/
areFriends(N1, N2) :-
	female(N1),
	female(N2),
	N1 \= N2,
	likes(N1, Item),
	likes(N2, Item),
	\+ male(Item),
	\+ enemies(N1,N2),
	\+ enemies(N2,N1).

areFriends(N1, N2) :-
	male(N1),
	male(N2),
	N1 \= N2,
	likes(N1, Item),
	likes(N2, Item),
	\+ female(Item),
	\+ enemies(N1,N2),
	\+ enemies(N2,N1).
	
areFriends(N1, N2) :-
	differentGender(N1, N2),
	\+ likes(N1, N2),
	\+ likes(N2, N1),
	likes(N1, Item),
	likes(N2, Item),
	\+ enemies(N1,N2),
	\+ enemies(N2,N1).
	
/* Returns true if they are opposite genders */
differentGender(N1, N2) :-
	male(N1),
	female(N2).
	
differentGender(N1, N2) :-
	female(N1),
	male(N2).
