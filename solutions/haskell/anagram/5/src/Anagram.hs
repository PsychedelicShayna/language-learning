module Anagram (anagramsFor) where

import Data.Char (toLower)
import qualified Data.Text as T

{-
 Instructions:
  An anagram is a rearrangement of letters to form a new word. Given a word
  and a list of candidates, select the sublist of anagrams of the given word.

  Given "listen" and a list of candidates like "enlists" "google" "inlets" "banana"
  the program should return a list containing "inlets". To completethis exercise
  you need to implement the function anagramsFor, that takes a word and a group
  of words, returning the ones that are anagrams of the given word.
-}

-- Logically, the problem can be boiled down into a simple set of conditions.
-- String A is an anagram of string B if: string A is not equal to string B,
-- the length of string A is equal to the length of string B, and characters
-- in string A occur an equal amount of times in string B, case insensitively.

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
