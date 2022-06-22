
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


-- A built-in higher order function "map", which works like it does in Python and
-- other languages that support functional programming concepts. It allows you
-- to run each element of a list through a lambda, returning a new list with 
-- eache lement mapepd to the return value when passed through the lambda.
-- The type of the output list isn't restricted by the type of the input list.

add1ToList :: [Int] -> [Int]
add1ToList xs = map (\x -> x + 1) xs








