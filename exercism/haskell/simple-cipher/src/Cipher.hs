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
