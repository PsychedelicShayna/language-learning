{-# LANGUAGE RecordWildCards #-}

-- RecordWildCards is a language extension, documentation here:
-- https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/record_wildcards.html
-- https://kodimensional.dev/recordwildcards

module DND
  ( Character (..),
    ability,
    modifier,
    character,
  )
where

import Data.List (sort)
import Test.QuickCheck (Gen, choose)

data Character = Character
  { strength :: !Int,
    dexterity :: !Int,
    constitution :: !Int,
    intelligence :: !Int,
    wisdom :: !Int,
    charisma :: !Int,
    hitpoints :: !Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier c = (c - 10) `div` 2

infiniteRolls :: Gen [Int]
infiniteRolls = sequence . repeat $ choose (1, 6)

ability :: Gen Int
ability = sum . tail . sort . take 4 <$> infiniteRolls

character :: Gen Character
character = do
  strength <- ability
  dexterity <- ability
  constitution <- ability
  intelligence <- ability
  wisdom <- ability
  charisma <- ability
  let hitpoints = 10 + modifier constitution
  return Character {..}