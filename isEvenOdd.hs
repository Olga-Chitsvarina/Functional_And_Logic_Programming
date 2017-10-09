--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------
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
