module LeapYear (isLeapYear) where

{- https://exercism.org/tracks/haskell/exercises/leap

  Instructions
    Given a year, report if it is a leap year.

    The tricky thing here is that a leap year in 
    the Gregorian calendar occurs:

    on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
-}

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