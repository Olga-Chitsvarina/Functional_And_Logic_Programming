--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------
-- This method takes the float number as a parameter (human age) and returns
-- the floating point number, representing the dog years as its result.
convertToDogYears :: Float -> Float 
convertToDogYears 0 = 0
convertToDogYears age 
        | (abs age) <= 2 = ((abs age) * 11) * sign
        | otherwise = (2 * 10.5 + rest*4) * sign
        

 where 
        rest = (abs age) - 2
        sign = age/(abs age)
 
