module GuessingGame (reply) where

-- In the previous iteration, 42 was checked via a guard clause, which
-- would be slower than just pattern matching 42 directly, as matching
-- 42 bypasses the other conditions.

reply :: Int -> String
reply 42 = "Correct"
reply guess
  | guess < 41 = "Too low"
  | guess > 43 = "Too high"
  | otherwise = "So close"