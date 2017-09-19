{- Author: Olga Chitsvarina
 - Date: September 18, 2017 
-------------------------------------------------------------------------------
GENERAL INFORMATION ABOUT THE FUNCTION:
	- The function fiveAreEqual takes 5 integers as the input
	- It returns boolean True if these 5 integers are equal
	- and False otherwise.
---------------------------------------------------------------------------------}
fiveAreEqual :: Int -> Int -> Int -> Int -> Int -> Bool	-- The function takes 5 parameters (integers) and returns a boolean value
fiveAreEqual a b c d e = (a==b) && (b==c) && (c==d) && (d==e) 	-- Return a = b = c = d = e

---------------------------------------------------------------------------------

