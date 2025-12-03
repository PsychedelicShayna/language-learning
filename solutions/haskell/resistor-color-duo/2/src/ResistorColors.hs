module ResistorColors (Color (..), value) where

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
