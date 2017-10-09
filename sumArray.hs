--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------
--This function takes the array of integers and
-- it returns their sum
sumArray :: [Int] -> Int
sumArray [] = 0
sumArray (x : xs) = x + sumArray xs
