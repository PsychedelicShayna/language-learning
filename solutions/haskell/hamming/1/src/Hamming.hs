module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just $ sum [fromEnum (uncurry (/=) e) | e <- zip xs ys]