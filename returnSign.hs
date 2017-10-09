--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------
-- This function takes the integer as a parameter, 
-- it returns -1 if parameter is a negative integer
-- it returns 0 if parameter is 0
-- it returns 1 if parameter is a positive integer:
returnSign :: Int -> Int
returnSign x
    | x < 0 = -1
    | x > 0 = 1
    | otherwise = 0

-------------------------------------------------------------------
