--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------
-- This function takes the array of integers, it removes the 
-- even values and returns only the odd ones.
removeEven :: [Int] -> [Int]
removeEven integers = [x| x <- integers, x `rem` 2 == 1]
