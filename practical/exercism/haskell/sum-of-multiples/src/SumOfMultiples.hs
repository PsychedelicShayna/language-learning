module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples fac lim = sum [ x | x <- [1..lim-1], any (divides x) (filter (/=0) fac) ]