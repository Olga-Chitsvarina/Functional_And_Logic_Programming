--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------
-- These two functions take list of integers as the parameter,
-- they remove the integers, which are divisible by 5 or 7 (or both)
-- and return the resulting list of integers:

returnNotDivBy5And7List :: [Int] -> [Int]
returnNotDivBy5And7List [] = []
returnNotDivBy5And7List list
        | (myHead `mod` 5 == 0) = returnNotDivBy5And7List myTail
        | (myHead `mod` 7 == 0) = returnNotDivBy5And7List myTail
        | otherwise = myHead : returnNotDivBy5And7List myTail
        
       where 
       myHead = head list
       myTail = tail list


returnNotDivBy5And7List' :: [Int] -> [Int]
returnNotDivBy5And7List' [] = []
returnNotDivBy5And7List' (x:xs)
        | (x `mod` 5 == 0) = returnNotDivBy5And7List' xs
        | (x `mod` 7 == 0) = returnNotDivBy5And7List' xs
        | otherwise = x : returnNotDivBy5And7List' xs
        
      
        
