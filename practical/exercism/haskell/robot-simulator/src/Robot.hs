module Robot
  ( Bearing (East, North, South, West),
    bearing,
    coordinates,
    mkRobot,
    move,
  )
where

data Bearing
  = North
  | East
  | South
  | West
  deriving (Eq, Show, Enum)

class Robot a where
  turnLeft :: a -> a
  turnRight :: a -> a
  advance :: a -> a
  move :: a -> String -> a

type Coordinates = (Integer, Integer)

data StandardRobot = StandardRobot { bearing     :: Bearing, 
                                     coordinates :: Coordinates }

instance Robot StandardRobot where
  turnRight (StandardRobot West (x, y)) = StandardRobot North    (x, y)
  turnRight (StandardRobot b    (x, y)) = StandardRobot (succ b) (x, y)

  turnLeft (StandardRobot North (x, y)) = StandardRobot West     (x, y)
  turnLeft (StandardRobot b     (x, y)) = StandardRobot (pred b) (x, y)

  advance (StandardRobot b@North (x, y)) = StandardRobot b (x, y + 1)
  advance (StandardRobot b@South (x, y)) = StandardRobot b (x, y - 1)
  advance (StandardRobot b@East  (x, y)) = StandardRobot b (x + 1, y)
  advance (StandardRobot b@West  (x, y)) = StandardRobot b (x - 1, y)

  move robot ('R' : xs) = move (turnRight robot) xs
  move robot ('L' : xs) = move (turnLeft  robot) xs
  move robot ('A' : xs) = move (advance   robot) xs
  move r _ = r

mkRobot :: Bearing -> (Integer, Integer) -> StandardRobot
mkRobot b (x, y) = StandardRobot b (x, y)