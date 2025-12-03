module ProteinTranslation(proteins) where

import Control.Monad (liftM2)

proteins :: String -> Maybe [String]
proteins (x : y : z : xs)
  | not $ all (`elem` "ACGU") codon = Nothing
  | codon `elem` ["UAA", "UAG", "UGA"] = Just []
  | codon `elem` ["UCU", "UCC", "UCA", "UCG"] = Just "Serine" <:> proteins xs
  | codon `elem` ["UUU", "UUC"] = Just "Phenylalanine" <:> proteins xs
  | codon `elem` ["UUA", "UUG"] = Just "Leucine" <:> proteins xs
  | codon `elem` ["UAU", "UAC"] = Just "Tyrosine" <:> proteins xs
  | codon `elem` ["UGU", "UGC"] = Just "Cysteine" <:> proteins xs
  | codon == "AUG" = Just "Methionine" <:> proteins xs
  | codon == "UGG" = Just "Tryptophan" <:> proteins xs
  | otherwise = Just []
  where
    codon = x : y : z : ""
    (<:>) = liftM2 (:)
proteins _ = Just []