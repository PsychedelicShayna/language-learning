module Bob (responseFor) where
import Data.Char

{- https://exercism.org/tracks/haskell/exercises/bob

  Instructions:
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    Bob answers 'Sure.' if you ask him a question, such as "How are you?".
    He answers 'Whoa, chill out!' if you YELL AT HIM (in all capitals).
    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.
    He says 'Fine. Be that way!' if you address him without actually saying anything.
    He answers 'Whatever.' to anything else.
-}

responseFor :: String -> String
responseFor xs
  | isBlank    = "Fine. Be that way!"
  | isQuestion = if isScreaming then "Calm down, I know what I'm doing!"
                                else "Sure."

  | isScreaming = "Whoa, chill out!"
  | otherwise   = "Whatever."
  where
    isQuestion  = last (filter (not . isSpace) xs) == '?'
    isScreaming = any (`elem` ['A'..'Z']) xs && not (any (`elem` ['a'..'z']) xs)
    isBlank     = null xs || all isSpace xs