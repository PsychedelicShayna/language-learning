module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromListWith) 
import Data.Char (toUpper)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read)

-- The either type, either returns the type on the left (String), or the type
-- on the right (Map Nucleotide Int). In order to return one type or another,
-- the type has to be wrapped in Left of Right.

nucleotideCounts :: String -> Either String (Map Nucleotide Int)

nucleotideCounts s
  -- "all" is used to pass every character in the string "s", through the
  -- predicate on the left: `elem` "ACGT" which returns true if the character
  -- is present within the string "ACGT", false if not. Not is then used to
  -- invert the bool, in which case, the string should be returned as is.
  | not $ all (`elem` "ACGT") s = Left s

  -- fromListWith constructs a map from a list of key value pairs, but also
  -- applies a function to the value of two k,v pairs where the the keys are
  -- the same, rather tha overwriting the existing key's value with the new
  -- value like the regular fromListWith function does. This works because when
  -- two characters, say, two "A"'s, are present in the string s, two ("a", 1) 
  -- entries will exist in the list, which will become ("a", 2), effectively
  -- counting the occurrences of "a". The list itself is constructed using list 
  -- comprehension, where each character from the string s is used to construct 
  -- a tuple of (f, 1), where f is (read [toUpper c]), which reads the string 
  -- [toUpper c], and turns it into a value of type Nucleotide. This is possible 
  -- because data Nucleotide derives from Read. [toUpper c] is wrapped in [] 
  -- because c is of type char, and read expects a string, but an array of char 
  -- is equivalent.

  | otherwise = 
      Right $ Data.Map.fromListWith (+) [(read [toUpper c], 1) | c <- s]
 