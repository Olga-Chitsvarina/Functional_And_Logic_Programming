--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------
-- This is a polymorphic function, which takes the Num parameter A, computes A+2
-- and returns it
addTwo :: Num a => a -> a
addTwo a1 = a1 + 2

-- This is a polymorphic function, which takes a function and a tuple as parameters
-- and applies the function to every element in the tuple, it returns the resulting tuple
applyToTuple :: (a -> b) -> (a,a) -> (b,b)
applyToTuple f (a1,a2) = (f a1, f a2)


      
        
