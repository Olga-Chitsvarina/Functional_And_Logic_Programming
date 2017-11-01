--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------

-- This function takes the list as a parameter and returns the sum of 
-- elements in the list
sumList :: [Int] -> Int
sumList list = foldr (+) 0 list


-- This function finds the minimum number in the list
minInList :: [Int] -> Int
minInList list = foldr min 1 list


-- This function computes the dot product of two lists, passed in as parameters
dotProduct :: [Int] -> [Int] -> Int
dotProduct listA listB = foldr (+) 0 (zipWith (*) listA listB)
        
