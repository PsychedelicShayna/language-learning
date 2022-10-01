module ResistorColors (Color (..), Resistor (..), label, ohms) where

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
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor {bands :: (Color, Color, Color)}
  deriving (Show)

data Prefix = None | Kilo | Mega | Giga
  deriving (Enum)

instance Show Prefix where
  show None = ""
  show Kilo = "kilo"
  show Mega = "mega"
  show Giga = "giga"

getPrefix :: Int -> Prefix -> (Int, Prefix)
getPrefix x Giga = (x, Giga)
getPrefix x p
  | x > 1000 = getPrefix (x `div` 1000) (succ p)
  | otherwise = (x, p)

label :: Resistor -> String
label resistor = show value ++ " " ++ show prefix ++ "ohms"
  where
    (value, prefix) = getPrefix (ohms resistor) None

concatInt :: Int -> Int -> Int
concatInt x 0 = x * 10
concatInt x y = x * (10 ^ floor (logBase 10 (fromIntegral y) + 1)) + y

ohms :: Resistor -> Int
ohms resistor = concatInt (fromEnum x) (fromEnum y) * 10 ^ fromEnum z
  where
    (x, y, z) = bands resistor
