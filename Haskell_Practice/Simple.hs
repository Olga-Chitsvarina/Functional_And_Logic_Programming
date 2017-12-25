--Imports:
import Data.Char

---------------------------------------------------------------------------------
--This function always returns the number 5
alwaysFive :: Int       -- Define the name of the function ("alawaysFive")
                        -- Specify that "alwaysFive" returns an Integer
alwaysFive = 5          -- Return the integer 5 as the output for the function

---------------------------------------------------------------------
--This function takes the integer input (parameter) and 
--returns the square of that number as the output (integer).
toSquare :: Int -> Int  -- Parameter type: integer. Output type: integer
toSquare x = x*x        -- Square the number and return the result


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
xor1 :: Bool -> Bool -> Bool    -- parameter1: bool, parameter2: bool, return type: bool 
xor1 False False = False        -- case1: False and False, the output is False
xor1 False True  = True         -- case2: False and True, the output is True
xor1 True  False = True         -- case3: True and False, the output is True
xor1 True  True  = False        -- case4: True and True, the output is False


--LOGICAL EXPRESSION1: a'b + ab' (based on the truth table above), SOLUTION 2:
xor2 :: Bool -> Bool -> Bool            -- parameter1: bool, parameter2: bool, return type:bool 
xor2 a b = ((not a)&&b)||(a&&(not b))   -- return: result of the logical expression a'b + ab'


--LOGICAL EXPRESSION2: a/=b (based on the truth table above), SOLUTION 3:	
xor3 :: Bool -> Bool -> Bool    -- parameter1: bool, parameter2: bool, return type:bool 
xor3 a b = (a /= b)             -- return: result of the logical expression a/=b


--IF...THEN...ELSE and LOGICAL EXPRESSION2, SOLUTION 4:
xor4 :: Bool -> Bool -> Bool                    -- parameter1: bool, parameter2: bool, return type:bool 
xor4 a b = if (a /= b) then True else False     -- return: result of the logical expression a/=b


--GUARDS1 and LOGICAL EXPRESSION2, SOLUTION 5:
xor5 :: Bool -> Bool -> Bool    -- parameter1: bool, parameter2: bool, return type:bool
xor5 a b                        -- variables a and b
  | a == b = False              -- a is equal to b? If "yes" then return False
  | otherwise = True            -- otherwise return True


--GUARDS2 and LOGICAL EXPRESSION2, SOLUTION 6:
xor6 :: Bool -> Bool -> Bool    -- parameter1: bool, parameter2: bool, return type:bool
xor6 a b                        -- variables a and b
  | a == b = False              -- if a == b then return False
xor6 a b = True                 -- return True

------------------------------------------------------------------------------------------------

-- This function takes the integer as a parameter, 
-- it returns -1 if parameter is a negative integer
-- it returns 0 if parameter is 0
-- it returns 1 if parameter is a positive integer:
returnSign :: Int -> Int
returnSign x
    | x < 0 = -1
    | x > 0 = 1
    | otherwise = 0

--------------------------------------------------------------------------------------------
{-GENERAL INFORMATION ABOUT THE FUNCTION:
	- The function fiveAreEqual takes 5 integers as the input
	- It returns boolean True if these 5 integers are equal
	- and False otherwise.-}

fiveAreEqual :: Int -> Int -> Int -> Int -> Int -> Bool         -- The function takes 5 parameters (integers) and returns a boolean value
fiveAreEqual a b c d e = (a==b) && (b==c) && (c==d) && (d==e)   -- Return a = b = c = d = e

--------------------------------------------------------------------------------------
{-      A | B | NAND
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
nAnd1 :: Bool -> Bool -> Bool           -- Define the function: 2 parameters and the return type 
nAnd1 False False = True                -- case1: False and False, return True 
nAnd1 False True  = True                -- case2: False and True, return True
nAnd1 True  False = True                -- case3: True and False, return True
nAnd1 True  True  = False               -- case4: True and True, return False


-- LOGICAL EXPRESSION (a and b)' (based on the truth table), SOLUTION 2:
nAnd2 :: Bool -> Bool -> Bool           -- Define the function: 2 parameters and the return type 
nAnd2 a b = not(a && b)                 -- Return the result of the logical expression "not(a and b)"


-- IF...THEN...ELSE and LOGICAL EXPRESSION (a == b == True), SOLUTION 3:
nAnd3 :: Bool -> Bool -> Bool                                   -- Define the function: 2 parameters and the return type 
nAnd3 a b = if ((a==True)&&(b==True)) then False else True      -- Return the result of a == b == True

----------------------------------------------------------------------------------------

-- This function returns the minimum number of two Float numbers:
minTwo:: Float -> Float -> Float
minTwo a b 
    | (a <= b) = a
    |otherwise = b

--This function returns the minimum number of three Float numbers,
-- it does the comparison, based on the returned value by minTwo
minThree :: Float -> Float -> Float -> Float
minThree a b c = minTwo (minTwo a b) c

------------------------------------------------------------------------------------
-- This function multiplies 3 Float numbers:
multiplyThree :: Float -> Float -> Float -> Float
multiplyThree a b c = a*b*c

----------------------------------------------------------------------------------
-- This function takes two parameters of type Float: 
-- first number is the base, second number is a power
-- It returns base ^ power.
pow :: Float -> Float -> Float
pow x p
    | p == 0 = 1
    | p < 0 = 1/(pow x (p*(-1)))
    | otherwise = x*pow x (p-1)

------------------------------------------------------------------------
-- This method converts the character 'chr' to corresponding integer chr
-- For example, characterToInteger '8' returns the Int 8
characterToInteger :: Char -> Int
characterToInteger character = ord character - 48

-------------------------------------------------------------
-- This method takes the float number as a parameter (human age) and returns
-- the floating point number, representing the dog years as its result.
convertToDogYears :: Float -> Float 
convertToDogYears 0 = 0
convertToDogYears age 
        | (abs age) <= 2 = ((abs age) * 11) * sign
        | otherwise = (2 * 10.5 + rest*4) * sign
        
 where 
        rest = (abs age) - 2
        sign = age/(abs age)

----------------------------------------------------------------------------

--This function divides the floating point numerator 
-- by the floating point denominator. 
-- This function signals about the error, if denominator is 0.
-- Pattern matching is used here:
myDiv :: Float -> Float -> Float
myDiv _ 0 = error "\nERROR :(\nYou cannot divide by 0!!!"
myDiv numerator denominator = numerator / denominator


--This function divides the floating point numerator 
-- by the floating point denominator. 
-- This function signals about the error, if denominator is 0.
-- Guards are used here:
myDiv2 :: Float -> Float -> Float
myDiv2 numerator denominator 
  | denominator /= 0 = numerator /denominator
  | otherwise = error "\nERROR :(\nYou cannot divide by 0!!!"

---------------------------------------------------------------------

-- This function takes 2 Floats
-- This function returns 
-- True if two numbers are equal
-- Otherwise, it returns False:
twoAreEqual :: Float -> Float -> Bool
twoAreEqual x y = x == y

--This function takes 3 Floats
--This function returns
--True if three numbers are equal
--Otherwise, it returns False:
threeAreEqual :: Float -> Float -> Float -> Bool
threeAreEqual x y z = (twoAreEqual x y) && (twoAreEqual y z)

-- This function takes 3 Floats
-- This function returns
-- True, if none of three numbers are equal to the other one
-- False, if at least one pair of equal numbers is present
threeAreNotEqual :: Float -> Float -> Float -> Bool
threeAreNotEqual x y z = (x/=y)&&(y/=z)&&(z/=x)

--This function takes three Floats
-- This function returns
-- 3 if all three numbers are equal
-- 2 if two numbers are equal
-- 0 if there is no equal pairs of numbers
howManyAreEqual :: Float -> Float -> Float -> Int
howManyAreEqual x y z 
    | threeAreEqual x y z    == True = 3
    | threeAreNotEqual x y z == True = 0
    | otherwise                      = 2
---------------------------------------------------------------

-- This function takes the integer parameter 
-- It return true if that parameter is an even number
-- and False otherwise
isEven :: Int -> Bool
isEven x
    | x `rem` 2 == 0 = True
    | otherwise = False


-- This function takes the integer parameter 
-- It return true if that parameter is a odd number
-- and False otherwise
isOdd :: Int -> Bool
isOdd x
    | isEven x == True = False
    | otherwise = True