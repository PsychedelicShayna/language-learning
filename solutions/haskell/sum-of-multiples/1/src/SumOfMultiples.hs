module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples fac lim = sum [ x | x <- [1..lim-1], any ((==0) . mod x) (filter (/=0) fac)]