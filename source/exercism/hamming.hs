{- https://exercism.org/tracks/haskell/exercises/hamming
Instructions
  Calculate the Hamming Distance between two DNA strands.

  If we compare two strands of DNA and count the differences between them we can
  see how many mistakes occurred. This is known as the "Hamming Distance".

  We read DNA using the letters C,A,G and T. Two strands might look like this:

  GAGCCTACTAACGGGAT
  CATCGTAATGACGGCCT
  ^ ^ ^  ^ ^    ^^
  They have 7 differences, and therefore the Hamming Distance is 7.

  The Hamming distance is only defined for sequences of equal length, so an
  attempt to calculate it between sequences of different lengths should not work.
  The general handling of this situation (e.g., raising an exception vs returning
  a special value) may differ between languages.
-}

module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just $ sum [1 | e <- zip xs ys, uncurry (/=) e]
