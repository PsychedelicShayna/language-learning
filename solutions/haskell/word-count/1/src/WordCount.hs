module WordCount (wordCount) where

import Data.Char (isAlphaNum, toLower)
import Data.List.Split as S
import Data.Map (Map, fromListWith)

wordCount :: String -> Map String Int
wordCount xs = fromListWith (+) [(w, 1) | w <- map (elimQuotes . map toLower) ws]
  where
    ws = S.wordsBy (\c -> c /= '\'' && not (isAlphaNum c)) xs

elimQuotes :: String -> String
elimQuotes xs
  | head xs == '\'' && last xs == '\'' = init (tail xs)
  | otherwise = xs