module Bob (responseFor) where
import Data.Char

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