module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toLower)

scoreLetter :: Char -> Integer
scoreLetter l
  | ll `elem` "aeioulnrst" = 1
  | ll `elem` "dg"         = 2
  | ll `elem` "bcmp"       = 3
  | ll `elem` "fhvwy"      = 4
  | ll `elem` "k"          = 5
  | ll `elem` "jx"         = 8
  | ll `elem` "qz"         = 10
  | otherwise              = 0
  where ll = toLower l

scoreWord :: String -> Integer
scoreWord word = sum $ map scoreLetter word