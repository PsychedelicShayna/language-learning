{- https://exercism.org/tracks/haskell/exercises/rotational-cipher

Instructions:
  Create an implementation of the rotational cipher, also sometimes called
  the Caesar cipher.

  The Caesar cipher is a simple shift cipher that relies on transposing all
  the letters in the alphabet using an integer key between 0 and 26.

  Using a key of 0 or 26 will always yield the same output due to
  modular arithmetic.

  The letter is shifted for as many values as the value of the key.

  The general notation for rotational ciphers is ROT + <key>.
  The most commonly used rotational cipher is ROT13.

  A ROT13 on the Latin alphabet would be as follows:

  Plain:  abcdefghijklmnopqrstuvwxyz
  Cipher: nopqrstuvwxyzabcdefghijklm
-}

module RotationalCipher (rotate) where

import Data.Char (chr, isAlpha, isUpper, ord)

rotate :: Int -> String -> String
rotate r = map $ rotateChar r
  where
    rotateChar r x
      | isAlpha x =
        let base = if isUpper x then 'A' else 'a'
         in chr $ ord base + mod (ord x - ord base + r) 26
      | otherwise = x
