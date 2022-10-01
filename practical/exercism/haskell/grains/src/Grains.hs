module Grains (square, total) where

-- This exercise is based on an interesting tale, worth listening to:
-- https://www.youtube.com/watch?v=eJmWu18pWtI

square :: Integer -> Maybe Integer
square n
  | n > 64 = Nothing
  | n < 1 = Nothing
  | otherwise = Just $ 2 ^ (n - 1)

-- The most intuitive and readable way to get the total amount, in my opinion.
total :: Integer
total = sum [2 ^ (n - 1) | n <- [1 .. 64]]

-- Not entirely convinced that this is faster than sum over list comprehension.
totalAlternate = foldl (\a n -> a + 2 ^ (n - 1)) 0 [0 .. 64]

-- I'm also not sure foldl or foldr is the better choice here, since both cases
-- would result in the evaluation of the entire list [0 .. 64], so the benefit
-- of using foldr doesn't really apply here, though I might imagine that using
-- foldl and thereby precomputing the entire list might be faster given that
-- the entire list has to be precomputed either way, and foldr would only do so
-- step by step, as needed. Realistically, foldr or foldl in this scenario would 
-- probably compile down to the same assembly anyway.