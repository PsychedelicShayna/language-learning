-- An alternative way to write this function.

normalAdd :: Int -> Int -> Int
normalAdd a b = a + b

-- Is to use currying, that is, a function that only takes one argument,
-- and returns another function which only takes one argument.

addCurry :: Int -> (Int -> Int)
addCurry a = (\b -> a + b)

-- This pattern can be repeated as much as you want, here is a
-- function that returns a function that returns a function.
-- The addThreeNumsCurry function only takes one argument,
-- but can be called as if it had three.

addThreeNumsCurry :: Int -> (Int -> (Int -> Int))
addThreeNumsCurry a = (\b -> (\c -> a + b + c))
