{- Author: Olga Chitsvarina
 - Date: September 18, 2017-}
-----------------------------------------------------------------------------------------------
{-	A | B | XOR
  	-----------
	F | F | F
	-----------
	F | T | T
	-----------
	T | F | T
	-----------
	T | T | F
	----------- 	-}

-- PATTERN MATCHING, SOLUTION 1:
xor1 :: Bool -> Bool -> Bool	-- parameter1: bool, parameter2: bool, return type: bool 
xor1 False False = False	-- case1: False and False, the output is False
xor1 False True  = True		-- case2: False and True, the output is True
xor1 True  False = True		-- case3: True and False, the output is True
xor1 True  True  = False	-- case4: True and True, the output is False

------------------------------------------------------------------------------------------------
--LOGICAL EXPRESSION1: a'b + ab' (based on the truth table above), SOLUTION 2:
xor2 :: Bool -> Bool -> Bool		-- parameter1: bool, parameter2: bool, return type:bool 
xor2 a b = ((not a)&&b)||(a&&(not b))	-- return: result of the logical expression a'b + ab'

------------------------------------------------------------------------------------------------
--LOGICAL EXPRESSION2: a/=b (based on the truth table above), SOLUTION 3:	
xor3 :: Bool -> Bool -> Bool	-- parameter1: bool, parameter2: bool, return type:bool 
xor3 a b = (a /= b)		-- return: result of the logical expression a/=b

------------------------------------------------------------------------------------------------
--IF...THEN...ELSE and LOGICAL EXPRESSION2, SOLUTION 4:
xor4 :: Bool -> Bool -> Bool			-- parameter1: bool, parameter2: bool, return type:bool 
xor4 a b = if (a /= b) then True else False	-- return: result of the logical expression a/=b

------------------------------------------------------------------------------------------------
--GUARDS1 and LOGICAL EXPRESSION2, SOLUTION 5:
xor5 :: Bool -> Bool -> Bool	-- parameter1: bool, parameter2: bool, return type:bool
xor5 a b			-- variables a and b
  | a == b = False		-- a is equal to b? If "yes" then return False
  | otherwise = True		-- otherwise return True

-------------------------------------------------------------------------------------------------
--GUARDS2 and LOGICAL EXPRESSION2, SOLUTION 6:
xor6 :: Bool -> Bool -> Bool	-- parameter1: bool, parameter2: bool, return type:bool
xor6 a b			-- variables a and b
  | a == b = False		-- if a == b then return False
xor6 a b = True			-- return True

-------------------------------------------------------------------------------------------------
