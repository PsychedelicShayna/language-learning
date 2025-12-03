module Pangram (isPangram) where
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram s = all(`elem` map toLower s) ['a'..'z']