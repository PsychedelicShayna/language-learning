module Pangram (isPangram) where
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram s = all(\c -> countc c (map toLower s) > 0) alphabet
  where countc c = foldr (\cs acc -> if cs == c then acc + 1 else acc) 0
        alphabet = "abcdefghijklmnopqrstuvwxyz"