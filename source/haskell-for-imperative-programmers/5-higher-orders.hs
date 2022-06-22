
-- Higher order functions, like in other languages, are functions
-- that take other functions as arguments.

-- This function takes a function as its first argument, as seen in
-- its type signature (a -> b), a function that takes a and gives out b.

applyFunction :: (a -> b) -> a -> b
applyFunction function x = function x

add1 :: Int -> Int
add1 x = x + 1

applyAdd1 :: Int -> Int
applyAdd1 n = applyFunction add1 n

-- Anonymous functions in Haskell are used like this.
-- (\<args> -> <expression>), and can be passed just like regular functions.
applyAdd1Anonymous :: Int -> Int
applyAdd1Anonymous n = applyFunction (\x -> x + 1) n

-- Since functions are just values in Haskell, anonymous functions can
-- be stored inside of variables. It makes no difference compared to a
-- regular function.
add1Lambda :: Int -> Int
add1Lambda = (\x -> x + 1)



-- Haskell naturally has a "map" function, which appears in other languages with
-- partial support for functional programming, such as Python, Ruby, C++, etc.
-- Haskell actually pioneered a lot of these functional programming patterns.
-- Haskell's "map" function works as you would expect, it takes a function
-- and a list, then returns a new list where each element of the previous 
-- list is mapped to the return value of the function given that element.

-- Type of the output list is not restricted to that of the input list.
-- For example, here is a function that returns a list of booleans from
-- a list of integers, specifying whether or not that integer is even.

getIntsEven :: [Int] -> [Bool]
getIntsEven xs = map (\n -> even n) xs

-- Similarly, there is a filter function, which works just as you would
-- expect from other languages. Elements are filtered out of a list based
-- on the return value of a predicate function.

filterOutOdds :: [Int] -> [Int]
filterOutOdds xs = filter (\e -> even e) xs


-- Another important higher order function is "fold", aka reduce.
-- The first argument being a binary function, the second being
-- the initial value, the third being the list.

sumIntList :: [Int] -> Int
sumIntList xs = foldr (+) 0 xs










