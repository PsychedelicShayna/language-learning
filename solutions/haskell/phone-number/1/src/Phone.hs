module Phone (number) where

import Data.Char (isDigit)

clean :: String -> String
clean = removeCode . filter isDigit
  where
    removeCode str@(x : xs)
      | x == '1' = xs
      | otherwise = str
    removeCode xs = xs

validate :: String -> Maybe String
validate xs@[n1, _, _, n2, _, _, _, _, _, _]
  | n1 > '1' && n2 > '1' = Just xs
  | otherwise = Nothing
validate _ = Nothing

number :: String -> Maybe String
number = validate . clean
