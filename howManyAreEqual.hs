--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------
-- This function takes 2 Floats
-- This function returns 
-- True if two numbers are equal
-- Otherwise, it returns False:
twoAreEqual :: Float -> Float -> Bool
twoAreEqual x y = x == y

--This function takes 3 Floats
--This function returns
--True if three numbers are equal
--Otherwise, it returns False:
threeAreEqual :: Float -> Float -> Float -> Bool
threeAreEqual x y z = (twoAreEqual x y) && (twoAreEqual y z)

-- This function takes 3 Floats
-- This function returns
-- True, if none of three numbers are equal to the other one
-- False, if at least one pair of equal numbers is present
threeAreNotEqual :: Float -> Float -> Float -> Bool
threeAreNotEqual x y z = (x/=y)&&(y/=z)&&(z/=x)

--This function takes three Floats
-- This function returns
-- 3 if all three numbers are equal
-- 2 if two numbers are equal
-- 0 if there is no equal pairs of numbers
howManyAreEqual :: Float -> Float -> Float -> Int
howManyAreEqual x y z 
    | threeAreEqual x y z    == True = 3
    | threeAreNotEqual x y z == True = 0
    | otherwise                      = 2



