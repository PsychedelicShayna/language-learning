module LeapYear (isLeapYear) where

-- Original approach.
isLeapYear :: Integer -> Bool
isLeapYear year = (mod year 4 == 0 && mod year 100 /= 0) || mod year 400 == 0

-- Longer, but more readable and expressive solution.
isLeapYearAlt :: Integer -> Bool
isLeapYearAlt year
  | isDivisibleBy 400 = True
  | isDivisibleBy 100 = False
  | isDivisibleBy 4   = True
  | otherwise         = False
  where isDivisibleBy x = mod year x == 0