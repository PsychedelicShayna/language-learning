-- Ignore certain lints, as this code is educational, and not an actual
-- implementation of any problem, where the optimal way of doing something
-- might go against the point of exploring the language, and what can be
-- written with it.
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use and" #-}
{-# HLINT ignore "Use or" #-}




-- Folding in Haskell, namely the foldr function, follows this syntax.
-- Naturally, as a binary function is being applied, the list it is
-- being applied to, has to have at least two elements in it.

-- "a" is the element being processed in the list.
-- "b" is the accumulator type.

-- foldr calls the binary function with the element being processed
-- as the first argument, and the accumulator as the second argument.

-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr (<binary-func>) <initial-value> [x1, x2, x3.. etc] = x1 <func> x2 <func> x3 .. <func> <initial-value>

-- Using fold, the functions: sum, add, and or, among others, can be very easily reproduced.

-- The reason this works, is because arguments passed to a lambda
-- that haven't been explicitly bound, will end up being implicitly
-- passed as parameters to the function contained within.

-- In this case, the current element, and the accumulator are being
-- passed into the ( + ) lambda, which contains a binary function.

-- Functions inside of a lambda with unsatisfied arguments will
-- go through the list of arguments that haven't been specified
-- and pick in order of their occurrence. + needs two, it picks 
-- the first two unspecified args.

foldrSumElements xs = foldr ( + ) 0 xs
foldrAndElements xs = foldr ( && ) True xs
foldrOrElements xs = foldr ( || ) False xs

-- Similarly, only one of the two arguments could be defined, and the
-- other would be passed implicitly.

-- Here, the first argument is explicitly passed to the binary function
-- (+) but the second argument, the accumulator, isn't, so (+) taking
-- the accumulator as its second argument is implicit.
foldrSumElements2 xs = foldr (\x -> (+) x) xs

-- The fully explicit version of of the above.
foldrSumElements3 xs = foldr (\x y -> (+) x y)

-- Here is an example of a "count" function that counts the number of
-- times an element appears inside of a list. 

foldrCount e xs = foldr (\x acc -> if e == x then acc + 1 else acc) 0 xs

-- Here is another example that also makes use of the dollar sign operator.
-- The dollar sign version is a bit counter-intuitive. 

foldrIsAll e = foldr (\x -> (&&) $ e  == x) True

foldrIsAllNoDollar e = foldr (\x acc -> e == x && acc) True


-- Many of the functions dealing with lists can be built using foldr as well.

foldrLength xs = foldr (\x -> (+) 1) 0 xs

-- Here is a basic implementation of a map, where x is the element of the list
-- being processed, and y is the accumulator, which starts as an empty list.
-- The result of applying the function f to the element x, is prepended to
-- the empty list using :, achieving a map.
foldrMap f xs = foldr (\x y -> f x : y) [] xs

-- Thanks to implicit padding of arguments to functions in lambdas,
-- we can also reformulate it like this, where the accumulator is
-- implicitly passed to (:), as the second argument is not specified
-- but the element being processed is explicitly specified, and where
-- the result of the element being passed to f is being passed as the
-- second argument to the (:) function.
foldrMap2 f xs = foldr (\x -> (:) (f x)) [] xs 

-- It can even be formulated with no explicit arguments, by
-- using composition, where f is in need of an argument, which
-- is implicitly satisfied by the fist argument to the lambda,
-- and then (:) is in need of a second argument, after . has
-- passed the result of f being called with the first argument
-- to (:), which is implicitly satisfied by the second argument
-- to the lambda, which hasn't been explicitly specified.
foldrMap3 f xs = foldr ((:) . f) [] xs

-- Here, the x argument isn't actually being used when calculating
-- the length of xs, which might be a valid use case in situations
-- where the argument should be ignored, but there is a better way.
lengthIgnore1 xs = foldr (\x -> (+) 1) 0 xs

-- Using "const $" is another way to ignore an argument, without
-- having to separate arguments from the body of the lambda, using
-- an arrow, though it's not very expressive. It can be found in,
-- the wild, especially with foldr, so it's good to know.
lengthIgnore2 xs = foldr (const $ (+) 1) 0 xs

-- 
lengthIgnore3 xs = foldr (\_ -> (+) 1) 0 xs


-- There is also another variation of foldr, called foldl, so
-- fold right, and fold left. The difference between the two
-- makes more sense when looking at the order in which elements
-- are being processed.

-- foldr: https://wiki.haskell.org/wikiupload/3/3e/Right-fold-transformation.png
-- foldl: https://wiki.haskell.org/wikiupload/5/5a/Left-fold-transformation.png

-- Fold right, starts with the last element of the list,
-- and will build its way to th end. Where foldr, process a 
-- list from right to left, in that, the fifth function call 
-- in the chain of function calls, will get called with the 
-- accumulator as its argument, and the fifth element, and 
-- the fourth will get called with the result of the fifth 
-- function call, and the fourth element, and so on.

-- Fold left will start with the first element of the list, and
-- build its way to the end. The first function will get
-- called first, with accumulator as its first parameter, and 
-- the fifth element as its second parameter, the second function
-- will then be called with the result of the first, and the fourth
-- element as its arguments. Hence, left, left to right.



