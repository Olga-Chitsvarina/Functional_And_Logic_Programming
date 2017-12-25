--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------

-- This function removes all even numbers from the list,
-- using a) filter and b) lambda function
removeEven :: [Int] -> [Int]
removeEven list = filter (\x -> x `mod` 2 /= 0) list

--This function removes all even numbers and 
--squares odd numbers
squareOddRemoveEven :: [Int] -> [Int]
squareOddRemoveEven list =  map (\x -> x*x) (filter (\x -> x `mod`2 /= 0) list)



        
