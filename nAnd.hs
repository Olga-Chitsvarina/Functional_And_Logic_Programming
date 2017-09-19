{- Author: Olga Chitsvarina
 - Date: September 18, 2017	-}
------------------------------------------------------------------------------------------
{-	A | B | NAND
	-----------
	F | F | T
	-----------
	F | T | T
	-----------
	T | F | T
	----------
	T | T | F  	
				-}	

-- PATTERN MATCHING, TRUTH TABLE, SOLUTION 1:
nAnd1 :: Bool -> Bool -> Bool		-- Define the function: 2 parameters and the return type 
nAnd1 False False = True		-- case1: False and False, return True 
nAnd1 False True  = True		-- case2: False and True, return True
nAnd1 True  False = True		-- case3: True and False, return True
nAnd1 True  True  = False		-- case4: True and True, return False

-----------------------------------------------------------------------------------------
-- LOGICAL EXPRESSION (a and b)' (based on the truth table), SOLUTION 2:
nAnd2 :: Bool -> Bool -> Bool		-- Define the function: 2 parameters and the return type 
nAnd2 a b = not(a && b) 		-- Return the result of the logical expression "not(a and b)"

----------------------------------------------------------------------------------------
-- IF...THEN...ELSE and LOGICAL EXPRESSION (a == b == True), SOLUTION 3:
nAnd3 :: Bool -> Bool -> Bool					-- Define the function: 2 parameters and the return type 
nAnd3 a b = if ((a==True)&&(b==True)) then False else True	-- Return the result of a == b == True

----------------------------------------------------------------------------------------
