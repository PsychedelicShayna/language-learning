module ResistorColors (Color (..), value) where

{- https://exercism.org/tracks/haskell/exercises/resistor-color-duo/
The first 2 bands of a resistor have a simple encoding scheme: each color maps
to a single number. For example, if they printed a brown band (value 1)
followed by a green band (value 5), it would translate to the number 15.

The program will take color names as input and output a two digit number, even
if the input is more than two colors!

The band colors are encoded as follows:
  Black: 0
  Brown: 1
  Red: 2
  Orange: 3
  Yellow: 4
  Green: 5
  Blue: 6
  Violet: 7
  Grey: 8
  White: 9

From the example above: brown-green should return 15 brown-green-violet should
return 15 too, ignoring the third color.
-}

data Color
  = Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Eq, Show, Enum, Bounded)

concatInt :: Int -> Int -> Int
concatInt x 0 = x * 10
concatInt x y = x * (10 ^ floor (logBase 10 (fromIntegral y) + 1)) + y

value :: (Color, Color) -> Int
value (a, b) = concatInt (fromEnum a) (fromEnum b)
