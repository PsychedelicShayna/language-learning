
-- These are my solutions to a collection of 4 Haskell exercises from the following YouTube video.
-- https://www.youtube.com/watch?v=Cxkqrg8FCt8&list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV&index=5

-- Exercise #1, function that determines whether or not an element is present inside of an array.
-- Solution is roughly identical to the official solution.
eElem :: (Eq a) => a -> [a] -> Bool
eElem _ [] = False
eElem e l = (e == head l) || eElem e (tail l)




-- Exercise #2, function that removes duplicate elements from an array.
-- Solution is roughly identical to the official solution.
eNub :: (Eq a) => [a] -> [a]
eNub [] = []
eNub (x:xs)
 | eElem x xs = eNub xs
 | otherwise = x : eNub xs




-- Exercise #3, function that determines whether or not an array of ints is in ascending order.
-- My solution is different to the official solution.
eIsAsc :: [Int] -> Bool
eIsAsc [] = False
eIsAsc l = aux l 0
  where
    aux l cmp
      | null l = True
      | cmp > head l = False
      | otherwise = aux (tail l) (head l)

-- Official solution to exercise, better than my solution.
eIsAscOptimal :: [Int] -> Bool
eIsAscOptimal [] = True
eIsAscOptimal [_] = True
eIsAscOptimal (x:y:xs) = (x <= y) && eIsAscOptimal (y:xs)




-- Exercise #4, given an array of pairs (two-element tuples) where each pair of elements
-- denotes a path from the first element to the second element, e.g. "(2,4)" node 2 connects
-- to node 4, determine if there is a valid path from X to Y in the array of tuples.

-- This is the official solution. I could not come up with a solution to this.
eHasPath :: [(Int, Int)] -> Int -> Int -> Bool
eHasPath [] x y = x == y
eHasPath xs x y
  | x == y = True
  | otherwise = 
    let xs_no_start = [ (n,m) | (n,m) <- xs, n /= x] in
      or [ eHasPath xs_no_start m y | (n,m) <- xs, n == x]