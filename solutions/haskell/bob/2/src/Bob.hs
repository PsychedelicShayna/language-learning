module Bob (responseFor) where
import Data.Char

responseFor :: String -> String
responseFor xs
  | null xsf    = "Fine. Be that way!"
  | isQuestion  = if isScreaming then "Calm down, I know what I'm doing!"
                                 else "Sure."
  | isScreaming = "Whoa, chill out!"
  | otherwise   = "Whatever."
  where
    isQuestion  = last xsf == '?'
    isScreaming = any isUpper xsf && not (any isLower xsf)
    xsf         = filter (not . isSpace) xs