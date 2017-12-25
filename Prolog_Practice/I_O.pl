%-------------------------------------------------------------------------------

/* 	This predicate:
		Prints a new line,
		Prints text 'Starting from the new line this line is printed.'
		Prints another new line
		Assigns the variable Text to 'Next: It should print the variable name and this text'
		The variable, and the text assigned to it will be printed to the screen.
	*/
printing_using_write_and_var(text1, Text) :-
	nl,
	write('Starting from the new line this line is printed.'),
	nl,
	Text = 'Next: It should print the variable name and this text'.
	
%-------------------------------------------------------------------------------	
	
/* 	This predicate:
		Prints a new line,
		Prints text 'Starting from the new line this line is printed.'
		Prints another new line
		Prints 'Notice variables are not used, this line is printed after at the new line.'
		to the screen.
	*/
do_not_take_parameters_and_print :-
	nl,
	write('Starting from the new line this line is printed.'),
	nl,
	write('Notice variables are not used, this line is printed after at the new line.').
	
%-------------------------------------------------------------------------------	

/* This predicate:
		It will assign X, print its value using write, 
		It will assign Y to a number and prints it to the screen,
		prolog will output X and Y 
	*/
assign_vars_and_print(X, Y) :-
	X = 'First variable represents this text. It should be printed to the screen',
	write(X),
	write('Second variable is a number, print it below:'),
	nl,
	Y is 5,
	write(Y),
	write('Next prolog will output the variables discussed above').

%-------------------------------------------------------------------------------
	
/* 	These predicates:
		First predicate assigns X to 5, returns it,
		Second predicate outputs to the screen, returned by the first predicate number. 
	*/
return_five(X) :-
	X is 5.
	
print_result_of_other_predicate:-
	return_five(Returned_Number),
	write(Returned_Number).
	
%-------------------------------------------------------------------------------

/* Prints text with quotes and with no quotes */
print_quotes_no_quotes :-
	tab(1),
	write('Text with no quotes'),
	nl, tab(1),
	writeq('Text with quotes').
	
%------------------------------------------------------------------------------

/* Print message in string form and in ascii form. */
printMessage(Message1, Message2, Ascii1, Ascii2) :-
	Message1 = 'This is a string message number 1.',
	Ascii1 = "This is a string message number 1.",
	Message2 = 'This is not a string message number 1.',
	Ascii2 = "This is not a string message number 1.".
	
%--------------------------------------------------------------------------------

/* Always fails example */
notWorking(pen).
isWorking(computer).

always_fails_if_notWorking(X) :-
	notWorking(X),!, fail.
	
always_fails_if_notWorking(X) :-
	write('This item is not broken').
