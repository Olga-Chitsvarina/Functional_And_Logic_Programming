--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------

-- This function takes one parameter of type Int
-- It returns the factorial value of that number
factorial :: Int -> Int
factorial x
    | x < 0 = error "Number should be a nonnegative integer"
    | x == 0 = 1
    | x == 1 = 1
    | otherwise = x* (factorial(x-1))
