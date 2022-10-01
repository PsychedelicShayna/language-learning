module ProteinTranslation(proteins) where

import Control.Monad (liftM2)

proteins :: String -> Maybe [String]
proteins (x : y : z : xs)
  | not $ all (`elem` "ACGU") codon           = Nothing
  | codon `elem` ["UCU", "UCC", "UCA", "UCG"] = continue "Serine"
  | codon `elem` ["UUU", "UUC"]               = continue "Phenylalanine"
  | codon `elem` ["UUA", "UUG"]               = continue "Leucine"
  | codon `elem` ["UAU", "UAC"]               = continue "Tyrosine"
  | codon `elem` ["UGU", "UGC"]               = continue "Cysteine"
  | codon ==     "AUG"                        = continue "Methionine"
  | codon ==     "UGG"                        = continue "Tryptophan"
  | otherwise                                 = Just []
  where
    continue x = liftM2 (:) (Just x) (proteins xs)
    codon = x : y : z : ""
proteins _ = Just []
