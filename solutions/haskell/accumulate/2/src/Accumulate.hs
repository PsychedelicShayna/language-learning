module Accumulate (accumulate) where

-- Solution, if foldr is not allowed.
accumulate :: (a -> b) -> [a] -> [b]
accumulate _ [] = []
accumulate f (x:xs) = f x : accumulate f xs
  