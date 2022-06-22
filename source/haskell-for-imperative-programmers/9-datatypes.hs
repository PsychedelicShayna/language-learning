
-- Datatypes in Haskell can be defined using the data keyword.
-- Names of datatypes have to start with a capital letter.
-- The syntax for creating a datatype is as follows

-- data Name = Constructor1 <args> | Constructor2 <args> | ...

-- The proper name for "constructors" are actually tags, and
-- "args" are fields.

-- The simplest kind of datatype is this, where this is essentially
-- just an enum, where a value of type Color is "constructed" when 
-- Red, Orange, Yellow, etc, is called.

data Color =
    Red | Orange | Yellow | Green | Blue | Magenta


-- Here, an "enum value" is bound to some data, namely Int Int,
-- which can be used in pattern matching to perform specific
-- operations on that data, by matching the enum value.

data Calculation =
    Add Int Int | Sub Int Int | Mul Int Int | Div Int Int

calc :: Calculation -> Int
calc (Add x y) = x + y
calc (Sub x y) = x - y
calc (Mul x y) = x * y
calc (Div x y) = div x y

calcTest = calc (Add 1 2) -- Gives three.

