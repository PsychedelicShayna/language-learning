-- A list in haskell looks like a list in many other languages.
-- Since Haskell is statically typed, lists can only store elements
-- of the same type. Here's a function that returns a list of integers. 

justAList :: [Int]
justAList = [1,2,3,4,5]


-- New lists can also be constructed using colon ":" to prepend an element to an
-- existing list. Here is a function that prepends elements 1-5 to an empty list.
-- The order of evaluation is right to left, 5 : [] yields [5], so 4 : 5 : [] yields
-- [4, 5], so on and so forth.

justAPrependedList :: [Int]
justAPrependedList = 1 : 2 : 3 : 4 : 5 : []


-- Using colon to prepend can be used to generate a list for example.
-- Here is a function that generates an ascending list of numbers in 
-- a certain range, e.g 5 to 10, using colon prepend.

generateListOfRange :: Int -> Int -> [Int]
generateListOfRange from to
  | from < to = from : generateListOfRange (from + 1) to
  | from > to = []
  | otherwise = [to]


-- Many important functions for working with lists are included in the Haskell standard library.

-- The "head" function returns the first element in a list, and the "tail" function returns
-- everything after the first element, or the "tail" of the list. There is also "init", which
-- works like tail, but in reverse, returning everything except for the last element of a list.
-- Here are three functions that implement "head", "tail", and "init".

addOneToFirstElement :: [Int] -> Int
addOneToFirstElement list = head list + 1

replaceFirstElementWithOne :: [Int] -> [Int]
replaceFirstElementWithOne list = 1 : tail list

removeLastElement :: [Int] -> [Int]
removeLastElement list = init list -- This function is kind of redundant.

-- There is also the standard "length" function, that returns the length of a list.
prependLengthToList :: [Int] -> [Int]
prependLengthToList list = length list : list

-- The "null" function can be used to check if a list is empty or not. Can be used
-- to check if a list is suitable for other functions to be performed on it, like
-- head, tail and init. 
addIfEmpty :: a -> [a] -> [a]
addIfEmpty number list
  | null list = number : list
  | otherwise = list


-- For boolean lists, the "and" and "or" functions can be used to perform a logical
-- and on an entire list, or a logical or. This is equivalent to "any" and "all" in
-- Python for example, or std::all_of and std::any_of in C++. Here is a function
-- that simply returns the and of a list of booleans. It is kind of redundant.

redundantlyAndBoolList :: [Bool] -> Bool
redundantlyAndBoolList list = and list

-- And similarly for "or"

redundantlyOrBoolList :: [Bool] -> Bool
redundantlyOrBoolList list = or list


-- List comprehensions are a more elegant way of constructing lists, when compared to
-- the previous method of just recursively prepending to an empty list. The syntax
-- of a list comprehension is: 

-- [ <gen> | <elem> <- <list>, ..., <guard>, ... ]

-- where <gen> is the expression that will be applied for each element, and 
-- <list> is the list that will be iterated through to generate a new list, and
-- <elem> is the variable that will store the current list element, and <guard>
-- is a condition that can filter out elements from being included in the final result.
-- List comprehension in Haskell works similarly to Python, and is effectively just 
-- a "map" function. More than one <elem> can be defined, with more than one list,
-- in which case, for every element in the first list, every element in the second list
-- will be passed as a second argument to a tuple.

-- Here is a function that determines if every element in a list of integers is even, by
-- using list comprehension to map each element to a bool of whether or not the element is
-- even, and then using the "and" function to and all of the bools together.

intListEven :: [Int] -> Bool
intListEven list = and [ even element | element <- list ]


-- Another form of pattern matching using ":" colon can be used in order to separate
-- elements from a list into multiple parts. Using ":" in this context is very different
-- to using it when prepending to a list. Here, a pattern of x:y:xs is used, meaning, the
-- first two elements of the list are stored in x and y, and the rest of the list is stored
-- in xs. Since this is a pattern of a list with a minimum of two elements, a pattern has
-- to be specified for "else" cases, where the list doesn't contain two elements, which is
-- why [_] is declared before that, to catch "one ore more element" patterns, where there 
-- might not be enough to match the x:y:xs pattern. There is also an empty list pattern []
-- which [_] doesn't account for, since [_] is not an empty list.

-- This function replaces the first two elements of a list with their sum.

addFirstTwo :: [Int] -> [Int]
addFirstTwo [] = []
addFirstTwo [_] = []
addFirstTwo (x:y:xs) = x + y : xs


-- Tuples can also be used with pattern matching, for example..
-- let (x,y) = (1,2) in x => 1

getFirstOfPair :: (a, a) -> a
getFirstOfPair (x,_) = x

getSecondOfPair :: (a, a) -> a
getSecondOfPair (_, y) = y

sumTuplesTogether :: [(Int, Int)] -> [Int]
sumTuplesTogether xs = [ x+y | (x,y) <- xs ]









