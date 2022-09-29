module RunLength (decode, encode) where

import Data.Char (isDigit, isNumber)

-- This is the latest iteration, using "span" to do the heavy lifting, rather
-- than gathering the prefix manually. This is more readable, but the first
-- solution was also educational, since it forced me to do it by hand, without
-- Haskell's standard library, at least when it comes to the role span plays.
decode :: String -> String
decode text@(x : xs)
  | null prefix = x : decode xs
  | otherwise = replicate (read prefix - 1) (head rest) ++ decode rest
  where
    (prefix, rest) = span isDigit text
decode text = text

encode :: String -> String
encode text@(x : xs)
  | length prefix > 1 = show (length prefix) ++ x : encode rest
  | otherwise = x : encode xs
  where
    (prefix, rest) = span (== x) text
encode text = text

-- The older, first iteration, that is less readable, but doesn't make use of
-- the span function.

decodeOld :: String -> String
decodeOld encodedText = decode' encodedText "" Nothing
  where
    decode' :: String -> String -> Maybe String -> String
    decode' (x : xs) acc Nothing
      | isNumber x = decode' xs acc (Just [x])
      | otherwise = decode' xs (acc ++ [x]) Nothing
    decode' (x : xs) acc (Just r)
      | isNumber x = decode' xs acc (Just $ r ++ [x])
      | otherwise = decode' xs (acc ++ replicate (read r) x) Nothing
    decode' xs acc _ = acc

encodeOld :: String -> String
encodeOld text = encode' text "" Nothing 0
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
