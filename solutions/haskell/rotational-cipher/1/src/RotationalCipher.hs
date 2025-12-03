module RotationalCipher (rotate) where

import Data.Char (chr, isAlpha, isUpper, ord)

rotate :: Int -> String -> String
rotate r = map $ rotateChar r
  where
    rotateChar r x
      | isAlpha x =
        let base = if isUpper x then 'A' else 'a'
         in chr $ ord base + mod (ord x - ord base + r) 26
      | otherwise = x
