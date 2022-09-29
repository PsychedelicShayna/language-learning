{- https://exercism.org/tracks/haskell/exercises/triangle
Instructions

Determine if a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has at least two sides the same length.
(It is sometimes specified as having exactly two sides the same length, but
for the purposes of this exercise we'll say at least two.)

A scalene triangle has all sides of different lengths.

Note:
  For a shape to be a triangle at all, all sides have to be of length > 0,
  and the sum of the lengths of any two sides must be greater than or equal
  to the length of the third side. See Triangle Inequality.
  Dig Deeper

  The case where the sum of the lengths of two sides equals that of the third
  is known as a degenerate triangle - it has zero area and looks like a single
  line. Feel free to add your own code/tests to check for degenerate triangles.
-}

module Triangle (TriangleType (..), triangleType) where

import Data.List

data TriangleType
  = Equilateral
  | Isosceles
  | Scalene
  | Illegal
  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | not legality  = Illegal
  | equality >= 2 = Equilateral
  | equality == 1 = Isosceles
  | equality == 0 = Scalene
  | otherwise     = Illegal
  where
    equality = length $ filter (== True) [a == b, b == c, a == c]
    legality =
      let nonZero  = notElem 0 [a, b, c]
          nonDegen = all (\(a:b:c:_) -> a + b > c) (permutations [a, b, c])
       in not $ nonZero && nonDegen
