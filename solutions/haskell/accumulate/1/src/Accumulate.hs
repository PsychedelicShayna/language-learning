module Accumulate (accumulate) where

accumulate :: (a -> b) -> [a] -> [b]
accumulate f xs = foldr (\x acc -> f x : acc) [] xs