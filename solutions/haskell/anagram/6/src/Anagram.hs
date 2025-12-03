module Anagram (anagramsFor) where

import Data.Char (toLower)
import qualified Data.Text as T

anagramsFor :: T.Text -> [T.Text] -> [T.Text]
anagramsFor xs = filter (isAnagram xs)
  where
    isAnagram :: T.Text -> T.Text -> Bool
    isAnagram xs ys
      | T.compareLength xs (T.length ys) /= EQ = False
      | T.toCaseFold xs == T.toCaseFold ys = False
      | otherwise = T.all 
          (\c -> (T.length $ T.filter (==(toLower c)) (T.toLower xs))
              == (T.length $ T.filter (==(toLower c)) (T.toLower ys))) xs
