--Author: Olga Chitsvarina
--Date: October 9th, 2017 

-------------------------------------------------------------------
-- This function takes the Int number as a parameter and
-- it returns the n'th Fibonacci number as output
fib :: Int -> Int
fib n
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fib(n -1) + fib (n-2)

