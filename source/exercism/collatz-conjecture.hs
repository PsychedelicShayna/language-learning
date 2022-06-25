module CollatzConjecture (collatz) where

{-
  Instructions:
    The Collatz Conjecture or 3x+1 problem can be summarized as follows:

    Take any positive integer n. If n is even, divide n by 2 to get n / 2. 
    If n is odd, multiply n by 3 and add 1 to get 3n + 1. 
    Repeat the process indefinitely. 
    
    The conjecture states that no matter which number you start with, you will 
    always reach 1 eventually.

    Given a number n, return the number of steps required to reach 1.
-}

collatz :: Integer -> Maybe Integer
collatz x
  | x <= 0 = Nothing
  | otherwise = Just $ countSteps (fromInteger x) 0
    where
      countSteps y acc
        | y == 1 = acc
        | even (floor y) = countSteps (y / 2)       (acc + 1)
        | otherwise      = countSteps ((y * 3) + 1) (acc + 1)



