-- Functions in Haskell are first class, as in other languages like Kotlin,
-- functions are "values", and can be passed around to other functions, and
-- even declared within other functions.

-- Function signatures are comprised of a list of types of the function's
-- parameters, followed by the return type at the very end of the list.

inRange :: Int -> Int -> Int -> Bool
inRange min max x = x >= min && x <= max

-- The "a" type can be used to allow functions to work with any type, it
-- effectively means "any". For example, here is a function that takes any
-- type, and simply gives it back.

giveBack :: a -> a
giveBack anything = anything


-- Let bindings can be used to bind an expression to an "alias" of sorts, and
-- the "in" keyword can be used to use these aliases in another expression.

inRangeV2 :: Int -> Int -> Int -> Bool
inRangeV2 min max x =
  let 
    in_lower_bound = min <= x
    in_upper_bound = max >= x
  in
    in_lower_bound && in_upper_bound


-- Where bindings can be used to bind identifiers to a value in an expression where
-- those identifiers have not previously been defined.. This simplifies certain expressions, 
-- and opens doors for other concepts.

inRangeV3 :: Int -> Int -> Int -> Bool
inRangeV3 min max x = in_lower_bound && in_upper_bound
  where
    in_lower_bound = min <= x
    in_upper_bound = min >= x


-- Ternary if statements also exist in Haskell, but are quite different to imperative ifs.
-- The "then" keyword is a bit deceptive. The equivalent in this function would be &&.

inRangeV4 :: Int -> Int -> Int -> Bool
inRangeV4 min max x =
  if in_lower_bound then in_upper_bound else False 
  where
    in_lower_bound = min <= x
    in_upper_bound = min >= x


-- Binary functions, that is, functions taking two arguments, can be called using infix notation.
-- For example this function could be called as: 10 `add` 20 (those are tildes, not single quotes).
add :: Int -> Int -> Int
add x y = x + 


-- Additionally, function overloading in Haskell exists as well, where functions can have multiple
-- definitions, with different expressions. For