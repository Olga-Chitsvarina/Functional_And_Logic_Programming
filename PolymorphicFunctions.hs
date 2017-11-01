--Name: Olga Chitsvarina
--Date: October 31, 2017
-----------------------------------------------------------------------------

addTwo :: Int -> Int
addTwo a1 = a1 + 2

applyToTuple :: (a -> b) -> (a,a) -> (b,b)
applyToTuple f (a1,a2) = (f a1, f a2)


      
        
