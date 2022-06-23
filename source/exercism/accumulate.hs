module Accumulate (accumulate) where

-- Explicit version of foldr solution.
accumulate1 :: (a -> b) -> [a] -> [b]
accumulate1 f xs = foldr (\x acc -> f x : acc) [] xs


-- An alternative way to structure the foldr solution
-- is to use function composition and partial function
-- application.

accumulate2 :: (a -> b) -> [a] -> [b]
accumulate2 f = foldr ((:) . f) []


-- Alternative solution, if foldr is not allowed.
accumulate3 :: (a -> b) -> [a] -> [b]
accumulate3 _ [] = []
accumulate3 f (x:xs) = f x : accumulate3 f xs