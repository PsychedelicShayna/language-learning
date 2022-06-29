module DNA (toRNA) where

{- https://exercism.org/tracks/haskell/exercises/rna-transcription/

Instructions:
    Given a DNA strand, return its RNA complement (per RNA transcription).
    Both DNA and RNA strands are a sequence of nucleotides.

    The four nucleotides found in DNA are 
        (A) adenine,
        (C) cytosine,
        (G) guanine,
        (T) thymine

    Given a DNA strand, its transcribed RNA strand is formed by 
    replacing each nucleotide with its complement:
        A -> U
        C -> G
        T -> A
        G -> C

    Given invalid output, your program should return the first invalid character.
-}

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


