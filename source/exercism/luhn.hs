module Luhn (isValid) where
import Data.Char (isSpace, isNumber, digitToInt)

{- https://exercism.org/tracks/haskell/exercises/luhn

  Instructions:
    Given a number determine whether or not it is valid per the Luhn formula.
    The Luhn algorithm is a simple checksum formula used to validate a variety 
    of identification numbers, such as credit card numbers and Canadian Social 
    Insurance Numbers. The task is to check if a given string is valid.
  
  Validating a Number:
    Strings of length 1 or less are not valid. Spaces are allowed in the input,
    but they should be stripped before checking. All other non-digit characters 
    are disallowed.

  Example 1: valid credit card number: 4539 3195 0343 6467

  The first step of the Luhn algorithm is to double every second digit, starting
  from the right. We will be doubling: 4_3_ 3_9_ 0_4_ 6_6_

  If doubling the number results in a number greater than 9 then subtract 9 
  from the product. The results of our doubling: 8569 6195 0383 3437

  Then sum all of the digits: 8+5+6+9+6+1+9+5+0+3+8+3+3+4+3+7 = 80

  If the sum is evenly divisible by 10, then the number is valid. 
-}

isValid :: String -> Bool
isValid n = luhn xs [] where
  xs = map digitToInt (reverse $ filter isNumber n)
  luhn ys acc
    | length xs <= 1 = False
    | length acc == length xs = mod (sum acc) 10 == 0
    | odd (length acc + 1) = luhn (tail ys) (head ys : acc)
    | otherwise = let y = head ys * 2 in 
        luhn (tail ys) ((if y > 9 then y - 9 else y) : acc)  







