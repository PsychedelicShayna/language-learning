module Temperature (tempToC, tempToF) where

tempToC :: Integer -> Float
tempToC tempf = fromInteger (tempf - 32) / 1.8

tempToF :: Float -> Integer
tempToF tempc = ceiling $ tempc * 1.8 + 32.0