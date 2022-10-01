module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz x
  | x <= 0 = Nothing
  | otherwise = Just $ toInteger $ length $ 
      takeWhile (/= 1) (iterate (\x -> if even x then x `div` 2 
                                                 else x * 3 + 1) x)