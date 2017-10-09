--Author: Olga Chitsvarina
--Date: October 9th, 2017 

------------------------------------------------------------------
-- This function returns the minimum number of two Float numbers:
minTwo:: Float -> Float -> Float
minTwo a b 
    | (a <= b) = a
    |otherwise = b

------------------------------------------------------------------
--This function returns the minimum number of three Float numbers,
-- it does the comparison, based on the returned value by minTwo
minThree :: Float -> Float -> Float -> Float
minThree a b c = minTwo (minTwo a b) c
