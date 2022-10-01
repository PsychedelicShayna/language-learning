module PerfectNumbers (classify, Classification (..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

factorize :: Int -> [Int]
factorize x = [y | y <- [1 .. x - 1], x `mod` y == 0]

classify :: Int -> Maybe Classification
classify x
  | x <= 0 = Nothing
  | aliquot == x = Just Perfect
  | aliquot > x = Just Abundant
  | aliquot < x = Just Deficient
  | otherwise = Nothing
  where
    aliquot = sum $ factorize x