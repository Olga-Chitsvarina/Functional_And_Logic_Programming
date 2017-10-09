--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------

-- This function takes two parameters of type Float: 
-- first number is the base, second number is a power
-- It returns base ^ power.
pow :: Float -> Float -> Float
pow x p
    | p == 0 = 1
    | p < 0 = 1/(pow x (p*(-1)))
    | otherwise = x*pow x (p-1)


