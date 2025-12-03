module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz x
  | x <= 0 = Nothing
  | otherwise = Just $ countSteps (fromInteger x) 0
    where
      countSteps y acc
        | y == 1 = acc
        | even (floor y) = countSteps (y / 2)       (acc + 1)
        | otherwise      = countSteps ((y * 3) + 1) (acc + 1)