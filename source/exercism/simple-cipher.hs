{-

Step 1:
Giving "iamapandabear" as input to the encode function returns the cipher
"ldpdsdqgdehdu". Obscure enough to keep our message secret in transit.

When "ldpdsdqgdehdu" is put into the decode function it would return the
original "iamapandabear" letting your friend read your original message.

Step 2:
Shift ciphers are no fun though when your kid sister figures it out.
Try amending the code to allow us to specify a key and use that
for the shift distance. This is called a substitution cipher.

Here's an example:

Given the key "aaaaaaaaaaaaaaaaaa", encoding the string "iamapandabear"
would return the original "iamapandabear".

Given the key "ddddddddddddddddd", encoding our string "iamapandabear"
would return the obscured "ldpdsdqgdehdu"

-}

module Cipher (caesarDecode, caesarEncode, caesarEncodeRandom) where

import Data.Char (chr, isAlpha, isUpper, ord, toLower)
import System.Random (newStdGen, randomRs)

rotateChar :: Int -> Char -> Char
rotateChar r x
  | isAlpha x =
    let base = if isUpper x then 'A' else 'a'
     in chr $ ord base + mod (ord x - ord base + r) 26
  | otherwise = x

caesarDecode :: String -> String -> String
caesarDecode key text
  | null key = text
  | otherwise = fst $ foldl decode ("", 0) text
  where
    decode (xs, i) x =
      let r = negate $ ord (toLower $ cycle key !! i) - ord 'a'
       in (xs ++ [rotateChar r x], i + 1)

caesarEncode :: String -> String -> String
caesarEncode key text
  | null key = text
  | otherwise = fst $ foldl encode ("", 0) text
  where
    encode (xs, i) x =
      let r = ord (toLower $ cycle key !! i) - ord 'a'
       in (xs ++ [rotateChar r x], i + 1)

generateKey :: Int -> IO String
generateKey len = do take len . randomRs ('a', 'z') <$> newStdGen

caesarEncodeRandom :: String -> IO (String, String)
caesarEncodeRandom text = do
  key <- generateKey (length text)
  return (key, caesarEncode key text)
