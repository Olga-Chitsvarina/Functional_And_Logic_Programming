--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------
--This function divides the floating point numerator 
-- by the floating point denominator. 
-- This function signals about the error, if denominator is 0. 
myDiv :: Float -> Float -> Float
myDiv _ 0 = error "\nERROR :(\nYou cannot divide by 0!!!"
myDiv numerator denominator = numerator / denominator
