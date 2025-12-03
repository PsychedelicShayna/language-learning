module RunLength (decode, encode) where

import Data.Char (digitToInt, isNumber)

decode :: String -> String
decode encodedText = decode' encodedText "" Nothing
  where
    decode' :: String -> String -> Maybe String -> String
    decode' (x : xs) acc Nothing
      | isNumber x = decode' xs acc (Just [x])
      | otherwise = decode' xs (acc ++ [x]) Nothing
    decode' (x : xs) acc (Just r)
      | isNumber x = decode' xs acc (Just $ r ++ [x])
      | otherwise = decode' xs (acc ++ replicate (read r) x) Nothing
    decode' xs acc _ = acc

encode :: String -> String
encode text = encode' text "" Nothing 0
  where
    format :: Int -> Char -> String
    format i c
      | i > 1 = show i ++ [c]
      | otherwise = [c]

    encode' :: String -> String -> Maybe Char -> Int -> String
    encode' (x : xs) acc Nothing r
      | null xs = [x]
      | otherwise = encode' xs acc (Just x) 1
    encode' (x : xs) acc (Just p) r
      | null xs && x == p = acc ++ format (r + 1) p
      | null xs && x /= p = acc ++ format r p ++ [x]
      | x == p = encode' xs acc (Just x) (r + 1)
      | otherwise = encode' xs (acc ++ format r p) (Just x) 1
    encode' xs _ _ _ = xs
