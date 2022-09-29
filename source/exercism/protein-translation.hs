module ProteinTranslation (proteins) where

{-
Instructions

Translate RNA sequences into proteins.

RNA can be broken into three nucleotide sequences called codons, and then translated to a polypeptide like so:

RNA: "AUGUUUUCU" => translates to

Codons: "AUG", "UUU", "UCU" => which become a polypeptide with the following sequence =>

Protein: "Methionine", "Phenylalanine", "Serine"

There are 64 codons which in turn correspond to 20 amino acids; however, all of the codon sequences and resulting amino acids are not important in this exercise. If it works for one codon, the program should work for all of them. However, feel free to expand the list in the test suite to include them all.

There are also three terminating codons (also known as 'STOP' codons);
if any of these codons are encountered (by the ribosome), all translation ends and the protein is terminated.

All subsequent codons after are ignored, like this:

RNA: "AUGUUUUCUUAAAUG" =>

Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

Protein: "Methionine", "Phenylalanine", "Serine"

Note the stop codon "UAA" terminates the translation and the final methionine is not translated into the protein sequence.

Below are the codons and resulting Amino Acids needed for the exercise.
Codon 	Protein
UCU, UCC, UCA, UCG 	Serine
UAA, UAG, UGA 	STOP
UUU, UUC 	Phenylalanine
UUA, UUG 	Leucine
UAU, UAC 	Tyrosine
UGU, UGC 	Cysteine
AUG 	Methionine
UGG 	Tryptophan
-}

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
