--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------
-- Sum every element of one list to every element of the other list:
sumLists :: [Int] -> [Int] -> [Int]
sumLists listA listB = [a + b | a <- listA, b<- listB]

-- Sum first element with the first element of the list... nth element of the 
-- first list with the nth element of the second list:
sumListItems :: [Int] -> [Int] -> [Int]
sumListItems listA listB = [fst element + snd element | element <- zippedList]

        where
        zippedList = zip listA listB
        

        


      
        
