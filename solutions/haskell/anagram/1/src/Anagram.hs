module Anagram (anagramsFor) where
import Data.Char (toLower)

mapLower :: String -> String
mapLower = map toLower

charICount :: Char -> String -> Int
charICount x xs = length $ filter (== toLower x) (mapLower xs)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs ys = filter (isAnagram xs) ys
  where
    isAnagram xs ys
      | length xs /= length ys = False
      | mapLower xs == mapLower ys = False
      | otherwise = all (\x -> charICount x xs == charICount x ys) xs
