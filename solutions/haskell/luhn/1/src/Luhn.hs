module Luhn (isValid) where

import Data.Char (isNumber, digitToInt)

isValid :: String -> Bool
isValid n = luhn xs [] where
    xs = map digitToInt (reverse (filter isNumber n))
    luhn x y
      | length xs <= 1 = False
      | length y == length xs = mod (sum y) 10 == 0
      | even (length y + 1) = luhn (tail x) ((if head x * 2 > 9 then (head x * 2) - 9 else head x * 2) : y)
      | otherwise = luhn (tail x) (head x : y)