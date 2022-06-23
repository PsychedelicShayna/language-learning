module Temperature (tempToC, tempToF) where

{- https://exercism.org/tracks/haskell/exercises/temperature/

  1. Convert Farenheit to Celsius
    Implement the tempToC function to convert an Integer temperature 
    in Fahrenheit to its equivalent Float in Celsius rounded to the 
    nearest hundredth. 

    Temperature in degrees Celsius is defined as: T(°C) = (T(°F) - 32) / 1.8.

  2. Convert Celsius to Farenheit
    Implement the tempToF function to convert a Float temperature in Celsius to 
    its equivalent in Fahrenheit. For safety reasons, round up the result to the 
    next-highest Integer. 
    
    Temperature in degrees Farenheit is defined as: T(°F) = T(°C) × 1.8 + 32.
-}

tempToC :: Integer -> Float
tempToC tempf = fromInteger (tempf - 32) / 1.8

tempToF :: Float -> Integer
tempToF tempc = ceiling $ tempc * 1.8 + 32.0