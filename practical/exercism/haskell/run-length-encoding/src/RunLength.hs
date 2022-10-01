module RunLength (decode, encode) where

import Data.Char (isDigit)

-- This iteration makes use of span in order to collect prefixes, whereas the
-- last iteration did so manually through the use of recursion. This version
-- is more readable, however the last iteration still has educational value.

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

