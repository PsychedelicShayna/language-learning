module Acronym (abbreviate) where

import Data.Char (isUpper, toUpper, isSeparator, isPunctuation, isAlpha)

{-
Instructions:
Convert a phrase to its acronym.

Techies love their TLA (Three Letter Acronyms)!
Help generate some jargon by writing a program that converts a long name
like Portable Network Graphics to its acronym (PNG).
-}

filterWithPrev :: (Maybe a -> a -> Bool) -> [a] -> [a]
filterWithPrev f xs = takeWhilePrev' f Nothing xs
  where
    takeWhilePrev' f p (x : xs)
      | f p x     = x : takeWhilePrev' f (Just x) xs
      | otherwise =     takeWhilePrev' f (Just x) xs
    takeWhilePrev' _ _ _ = []

abbreviate :: String -> String
abbreviate xs = map toUpper (filterWithPrev keep xs)
  where
    keep Nothing curr = isUpper curr
    keep (Just prev) curr =
      let rule1 = isUpper       curr && not (isUpper prev)
          rule2 = isPunctuation prev && notElem prev ['\'', '`']
          rule3 = isSeparator   prev
       in isAlpha curr && (rule1 || rule2 || rule3)
