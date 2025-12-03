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

fromColor :: Color -> Int
fromColor Black = 0
fromColor Brown = 1
fromColor Red = 2
fromColor Orange = 3
fromColor Yellow = 4
fromColor Green = 5
fromColor Blue = 6
fromColor Violet = 7
fromColor Grey = 8
fromColor White = 9

concatInt :: Int -> Int -> Int
concatInt x 0 = x * 10
concatInt x y = x * (10 ^ floor (logBase 10 (fromIntegral y) + 1)) + y

value :: (Color, Color) -> Int
value (a, b) = concatInt (fromColor a) (fromColor b)
