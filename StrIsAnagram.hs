--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------
import Data.List

-- This function takes two strings
-- It returns true if one string is the anagram of the other
-- It returns false otherwise
isAnagram :: String -> String -> Bool
isAnagram strA strB = (sortedA == sortedB)
        where 
        sortedA = sort strA
        sortedB = sort strB
       
        


      
        
