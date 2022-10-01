module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = foldr transcribe (Right "")
  where
    transcribe :: Char -> Either Char String -> Either Char String
    transcribe x (Left acc) = Left acc
    transcribe x (Right acc)
      | x `notElem` "ACTG" = Left x
      | otherwise = Right $ case x of
          'A' -> 'U'
          'C' -> 'G'
          'T' -> 'A'
          'G' -> 'C'
          _   -> x
        : acc