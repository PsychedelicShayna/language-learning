-- There is no such thing as a for loop or a while look in Haskell.
-- In order to achieve this behavior in Haskell, one must use recursion.
-- This is of course, a concept in many other languages, but here is an
-- example of how recursion looks like in Haskell, with factorial.

factorial :: Int -> Int
factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)


-- A better way to express this function, rather than using if then else,
-- is to use "guards", which are in essence quite similar to an if then else,
-- but are much more flexible, and idiomatic. A guard simply changes the
-- definition of the function that will be used, depending on a condition.

-- The "otherwise" clause in a guard, is like an "else", where if none of
-- the above conditions apply, default to the following definition instead.

factorialV2 :: Int -> Int
factorialV2 n
  | n <= 1 = 1
  | otherwise = n * factorialV2 (n - 1)


-- Auxillary functions are another way to achieve recursion without actually calling
-- the main function recursively. This is a pattern where a function is defined within
-- another function, and that inner function is called recursively, and gives a result
-- to the outer function. Here is an example of a factorial function, using the same 
-- maths as the previous one, but using a where binding to define a second inner function
-- and delegating the recursion to that inner function. This pattern might also be known
-- as an accumulator.

factorialV3 :: Int -> Int
factorialV3 n = aux n 1      -- n and 1 are passed to the "aux" function, which hasn't been defined yet.
  where                      -- This "where" gives a definition to "aux", where "aux" takes params n and acc.
    aux n acc                -- The guard also conditionally changes the actual definition of the aux function.
      | n <= 1 = acc
      | otherwise = aux (n - 1) (n * acc)


-- There is also a concept known as pattern matching. A similar thing to draw
-- an analogy to would be wildcards, like the common "*" for "anything" - while,
-- pattern matching in Haskell is more complex, the principle is the same, you
-- are matching a pattern.

-- Here is an example of a function with two definitions, one that matches the
-- pattern of the value 0, and another which matches the "_" or "otherwise" pattern,
-- which is the same as if the function were to take a parameter, except the value
-- is dropped.

intIsZero :: Int -> Bool
intIsZero 0 = True
intIsZero _ = False

-- Here is an example where the "otherwise" pattern is bound to a parameter.
intIsZeroV2 :: Int -> Bool
intIsZeroV2 0 = True
intIsZeroV2 x = x /= 0 -- /= is not equal, != in other languages.
