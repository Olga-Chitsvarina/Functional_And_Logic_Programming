/* Defines what flowers Helen and Mary loves */
loves(female(mary), flower(peony)).
loves(female(helen), flower(rose)).

/* Helps to find a perfect gift for ladies */
perfect_gift(Name, Flower) :-
	loves(female(Name),flower(Flower)).
	
%-----------------------------------------------------

/* Finds the distance between two points */
distance_between_points( point(X1,Y1) , point(X2,Y2), Result ) :-
	Result is (sqrt( (X2-X1)*(X2-X1) + ((Y2-Y1)^2) )).
	
%-----------------------------------------------------------


/* Get the animal weight */
animal(elephant, heightM(3), weightKG(5000)).
animal(chimpanzee, heightM(1), weightKG(50)).

getWeight(Animal, Weight) :-
	animal(Animal, _, weightKG(Weight)).
