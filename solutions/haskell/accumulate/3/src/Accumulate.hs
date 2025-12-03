module Accumulate (accumulate) where

-- An alternative way to structure the foldr solution
-- is to use function composition and partial function
-- application.

accumulate :: (a -> b) -> [a] -> [b]
accumulate f = foldr ((:) . f) []