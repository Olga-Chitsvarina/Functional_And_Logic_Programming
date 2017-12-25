-------------------------------------------------------------------------
-- RELATED TO DATA STRUCTURE MONTH:

-- Define the datat type Month:
data Month =    Jan | Feb | Mar | Apr | May |Jun|
                Jul | Aug | Sep | Oct | Nov |Dec deriving (Ord, Eq, Enum)    

-- Custom implementation of Show for the Month Data Type:
instance Show Month where 
        show Jan = "January"
        show Feb = "February"
        show Mar = "March"
        show Apr = "April"
        show May = "May"
        show Jun = "June"
        show Jul = "July"
        show Aug = "August"
        show Sep = "September"
        show Oct = "October"
        show Nov = "November"
        show Dec = "December"

-- This function takes the instance of datat type Month and returns 
-- the corresponding time of the year:
timeOfTheYear :: Month -> String    
timeOfTheYear time
        | time < Mar || time > Nov = "Winter"
        | time < Jun               = "Spring"
        | time < Sep               = "Summer"
        | otherwise                = "Fall"   

-----------------------------------------------------------------------  
-- RECURSIVE ALGEBRAIC TYPES:


-- BinaryTree - is a data structure, which represents a binary tree
data BinaryTree =       Null |
                        Node Int BinaryTree BinaryTree deriving Show


-- This function returns the number of nodes in the binary tree
-- Ex: numberOfNodes (Node 10 (Node 9 Null Null) (Node 11 Null Null))
-- Returns 3   
numberOfNodes :: BinaryTree -> Int
numberOfNodes Null = 0
numberOfNodes (Node _ left right) = 1+(numberOfNodes left)+(numberOfNodes right)


-- This function calculates the height of the binary tree:
nodeIsInTheTree :: BinaryTree -> Int -> Bool
nodeIsInTheTree Null _ = False
nodeIsInTheTree (Node value left right) nodeValue 
        | value == nodeValue = True
        | otherwise = nodeIsInTheTree left nodeValue || nodeIsInTheTree right nodeValue 


-- This function indserts the node into the binary tree, if it is
-- not already present in the binary tree:
insertNode :: BinaryTree -> Int -> BinaryTree
insertNode Null nodeValue = Node nodeValue Null Null
insertNode (Node value left right) nodeValue
        | (nodeIsInTheTree (Node value left right) nodeValue) = (Node value left right) 
        | nodeValue > value = Node value left (insertNode right nodeValue)
        | otherwise = Node value (insertNode left nodeValue) right


--This function takes the list of integers and a tree. It inserts the nodes
--to that tree, using the values from the list. Then, it returns the 
--resulting tree:
insertNodes :: BinaryTree -> [Int] -> BinaryTree
insertNodes myTree list = foldl insertNode myTree list


-- This function takes the integer as a parameter, adds 5 to
-- that integer and returns the resulting integer
add5 :: Int -> Int
add5 a  = a + 5


-- This function takes the binary tree as a parameter, it
-- also takes a function as a second parameter. It maps the 
-- function over every node of the tree and returns the 
-- resulting tree
mapOverTreeNodes :: BinaryTree -> (Int -> Int) -> BinaryTree
mapOverTreeNodes Null function  = Null
mapOverTreeNodes (Node value left right) function = 
                                (Node (function value) 
                                (mapOverTreeNodes left function) 
                                (mapOverTreeNodes right function))


--------------------------------------------------------------------------
-- RELATED TO DATA STRUCTURE TOY:


-- Possible colors for the teddy bears
data Color = White | Blue | Red deriving (Ord, Eq)


-- Color is the instance of Show
instance Show Color where
        show White = "White"
        show Blue = "Blue"
        show Red = "Red"

-- Variety of toys
data Toy =     TeddyBear Color| PackOfCars Int 


-- Toy is the instance of Show
instance Show Toy where
        show (TeddyBear x) = "A " ++ show x ++ " Teddy Bear"
        show (PackOfCars y)
                | y<=1 = "One Car In The Pack"
                | otherwise = "A Pack of " ++ show y ++ " Cars"

--------------------------------------------------------------------------------  