module GuessingGame (reply) where

reply :: Int -> String
reply guess
  | guess < 41 = "Too low"
  | guess > 43 = "Too high"
  | guess == 42 = "Correct"
  | otherwise = "So close"