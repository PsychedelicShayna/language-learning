module Atbash (decode, encode) where

import Data.Char (isAlpha, isAlphaNum, toLower)
import Data.Map (Map, fromList, (!?))
import Data.Maybe (fromMaybe)

decode :: String -> String
decode cipherText =
  let lookupTable = fromList $ zip (reverse ['a' .. 'z']) ['a' .. 'z']
   in [fromMaybe x $ lookupTable !? toLower x | x <- cipherText, isAlphaNum x]

encode :: String -> String
encode plainText =
  let lookupTable = fromList $ zip ['a' .. 'z'] (reverse ['a' .. 'z'])
      cipherText = [fromMaybe x $ lookupTable !? toLower x | x <- plainText, isAlphaNum x]
      formatSpaces (i, x) acc
        | i `mod` 5 == 0 && i /= length cipherText = x : ' ' : acc
        | otherwise = x : acc
   in foldr formatSpaces "" $ zip [1 ..] cipherText
