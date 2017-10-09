--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------
--Imports:
import Data.Char

------------------------------------------------------------------
-- This method converts the character 'chr' to corresponding integer chr
-- For example, characterToInteger '8' returns the Int 8
characterToInteger :: Char -> Int
characterToInteger character = ord character - 48
