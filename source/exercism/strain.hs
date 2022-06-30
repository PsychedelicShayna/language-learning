module Strain (keep, discard) where

{-
  Instructions:
    Implement the keep and discard operation on collections. Given a collection 
    and a predicate on the collection's elements, keep returns a new collection 
    containing those elements where the predicate is true, while discard returns 
    a new collection containing those elements where the predicate is false.

    For example, given the collection of numbers: 1, 2, 3, 4, 5
    And the predicate: is the number even?

    Then your keep operation should produce: 2, 4
    While your discard operation should produce: 1, 3, 5

    Note that the union of keep and discard is all the elements.

    The functions may be called keep and discard, or they may need different 
    names in order to not clash with existing functions or concepts in your language.
-}

discard :: (a -> Bool) -> [a] -> [a]
discard p = keep (not . p)

keep :: (a -> Bool) -> [a] -> [a]
keep p (x:xs)
  | p x = x : keep p xs
  | otherwise = keep p xs
keep p xs = []
