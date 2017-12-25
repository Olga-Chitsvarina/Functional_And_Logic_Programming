--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------
-- These two functions take list of integers as the parameter,
-- they remove the integers, which are divisible by 5 or 7 (or both)
-- and return the resulting list of integers:

returnNotDivBy5And7ListRec1 :: [Int] -> [Int]
returnNotDivBy5And7ListRec1 [] = []
returnNotDivBy5And7ListRec1 list
        | (myHead `mod` 5 == 0) = returnNotDivBy5And7ListRec1 myTail
        | (myHead `mod` 7 == 0) = returnNotDivBy5And7ListRec1 myTail
        | otherwise = myHead : returnNotDivBy5And7ListRec1 myTail
        
       where 
       myHead = head list
       myTail = tail list


returnNotDivBy5And7ListRec2 :: [Int] -> [Int]
returnNotDivBy5And7ListRec2 [] = []
returnNotDivBy5And7ListRec2 (x:xs)
        | (x `mod` 5 == 0) = returnNotDivBy5And7ListRec2 xs
        | (x `mod` 7 == 0) = returnNotDivBy5And7ListRec2 xs
        | otherwise = x : returnNotDivBy5And7ListRec2 xs


returnNotDivBy5And7ListComprehensions :: [Int] -> [Int]
returnNotDivBy5And7ListComprehensions list =    [x|x <- list, 
                                                (x `rem` 5)/= 0, 
                                                (x `rem` 7)/= 0]
-----------------------------------------------------------------------------------------------------------------------
-- filter with helper
notDivBy5And7 :: Int -> Bool
notDivBy5And7 x 
        | x `mod` 5 == 0 = False
        | x `mod` 7 == 0 = False
        | otherwise = True

returnNotDivBy5And7ListHOFunct :: [Int] -> [Int]
returnNotDivBy5And7ListHOFunct list = filter notDivBy5And7 list 

-- lambda function
notDiv57Filter2 :: [Int] -> [Int]
notDiv57Filter2 list = filter (\x -> (x `rem` 5 >0 && x `rem` 7 >0)) list

-----------------------------------------------------------------------------------------------------------------------
notDiv57Fold :: [Int] -> [Int]
notDiv57Fold list = foldl (foldNotDiv57Help) [] list

foldNotDiv57Help :: [Int] -> Int -> [Int]
foldNotDiv57Help listB intA 
        | ((intA `rem` 5 == 0) || (intA `rem` 7 == 0)) = listB 
        | otherwise = listB ++ [intA]

      
        
