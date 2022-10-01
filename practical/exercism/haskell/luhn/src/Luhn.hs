module Luhn (isValid) where

import Data.Char (isNumber, digitToInt)

isValid :: String -> Bool
isValid n = luhn xs [] where
  xs = map digitToInt (reverse $ filter isNumber n)
  luhn ys acc
    | length xs <= 1 = False
    | length acc == length xs = mod (sum acc) 10 == 0
    | odd (length acc + 1) = luhn (tail ys) (head ys : acc)
    | otherwise = let y = head ys * 2 in 
        luhn (tail ys) ((if y > 9 then y - 9 else y) : acc)  