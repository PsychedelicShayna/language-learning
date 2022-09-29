{- https://exercism.org/tracks/haskell/exercises/atbash-cipher
Instructions:
  Create an implementation of the atbash cipher, an ancient encryption system
  created in the Middle East.

  The Atbash cipher is a simple substitution cipher that relies on transposing
  all the letters in the alphabet such that the resulting alphabet is backwards.
  The first letter is replaced with the last letter, the second with the second-last,
  and so on.

  An Atbash cipher for the Latin alphabet would be as follows:

  Plain:  abcdefghijklmnopqrstuvwxyz
  Cipher: zyxwvutsrqponmlkjihgfedcba
-}

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



