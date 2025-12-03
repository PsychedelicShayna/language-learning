module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor {bands :: (Color, Color, Color)}
  deriving (Show)

concatInt :: Int -> Int -> Int
concatInt x 0 = x * 10
concatInt x y = x * (10 ^ floor (logBase 10 (fromIntegral y) + 1)) + y

label :: Resistor -> String
label resistor
  | value > 1000000000 = show (value `div` 1000000000) ++ " gigaohms"
  | value > 1000000 = show (value `div` 1000000) ++ " megaohms"
  | value > 1000 = show (value `div` 1000) ++ " kiloohms"
  | otherwise = show value ++ " ohms"
  where
    value = ohms resistor

ohms :: Resistor -> Int
ohms resistor = concatInt (fromEnum x) (fromEnum y) * 10 ^ fromEnum z
  where
    (x, y, z) = bands resistor
