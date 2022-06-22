-- Ignore certain lints, as this code is educational, and not an actual
-- implementation of any problem, where the optimal way of doing something
-- might go against the point of exploring the language, and what can be
-- written with it.

{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Redundant lambda" #-}

import Data.List (sort)

-- Function composition can be used to compose new functions out of
-- an unlimited amount of existing functions, using the "." dot operator.

-- A composition chain of F1 . F2 . F3 just passes the result of
-- F3 to F2, and F2 to F1, leaving F3 as the only function which
-- hasn't been given an argument (which it might not need).

-- In this example, descSortComposed takes no arguments, but returns a function
-- composed of reverse and sort. Reverse is called with the result of
-- the sort function as its argument, and the sort function, being the
-- last function in the composition chain, expects an argument.

-- These three implementations are functionally equivalent.

descSortComposed  :: ([Int] -> [Int])
descSortComposed = reverse . sort

descSortCurrying :: ([Int] -> [Int])
descSortCurrying = \xs -> reverse (sort xs)

descSortVanilla :: [Int] -> [Int]
descSortVanilla xs = reverse (sort xs)


-- Another, more complex example of composition, is composing a 2D map function.

map2DComposed :: (Int -> Int) -> [[Int]] -> [[Int]]
map2DComposed = map . map

-- Which is equivalent to

map2DVanilla :: (Int -> Int) -> [[Int]] -> [[Int]]
map2DVanilla f xs = map (\ys -> map f ys) xs

-- This is easier to work through when imagining a list of rows, where each row
-- has a certain amount of integers.

-- let table = [           This is syntactically incorrect due to significant whitespace, but is easier to imagine.
--     [1, 2, 3, 4, 5],
--     [1, 2, 3, 4, 5],
--     [1, 2, 3, 4, 5],
--     [1, 2, 3, 4, 5],
--     [1, 2, 3, 4, 5]
-- ]

-- The same as map2DVanilla, but with more descriptive parameter names.

map2DTable :: (Int -> Int) -> [[Int]] -> [[Int]]
map2DTable function rows = map(\column -> map function column) rows

-- Using map2DComposed, we can add 1 to every int in every "column" of
-- a list of rows, i.e. a 2D list.
map2DComposedTest :: [[Int]]
map2DComposedTest = map2DComposed (+ 1) [[1,2,3,4], [1,2,3,4]]


-- Less importantly, but still worth mentioning, is the dollar sign $ operator.
-- This operator simply takes a function and calls that function with  the provided
-- the provided arguments. It's useful in order to avoid excessive parenthesis.
-- The signature being: ($) :: (a -> b) -> a -> b

-- For example: 

withoutDollar xs = map(+ 1) (filter (> 1) xs)

withDollar xs = map(+ 1) $ filter (> 1) xs
