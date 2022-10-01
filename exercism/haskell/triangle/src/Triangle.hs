module Triangle (TriangleType(..), triangleType) where

import Data.List

data TriangleType = Equilateral
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
       in nonZero && nonDegen