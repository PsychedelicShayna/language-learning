module Grains (square, total) where

{- https://exercism.org/tracks/haskell/exercises/grains/

  Instructions:
    Calculate the number of grains of wheat on a chessboard given that the
    number on each square doubles.

    There once was a wise servant who saved the life of a prince.
    The king promised to pay whatever the servant could dream up.
    Knowing that the king loved chess, the servant told the king
    he would like to have grains of wheat. One grain on the first
    square of a chess board, with the number of grains doubling
    on each successive square.

    There are 64 squares on a chessboard (where square 1 has one grain,
    square 2 has two grains, and so on).

    Write code that shows:
      How many grains were on a given square, and
      The total number of grains on the chessboard
-}

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
-- step by step, as needed.

-- Realistically, foldr or foldl in this scenario would probably compile down
-- to the same assembly anyway.
