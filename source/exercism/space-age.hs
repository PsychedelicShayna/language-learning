module SpaceAge (Planet(..), ageOn) where

{- https://exercism.org/tracks/haskell/exercises/space-age/iterations

  Instructions:
    Given an age in seconds, calculate how old someone would be on:
      Mercury: orbital period 0.2408467  Earth years
      Venus:   orbital period 0.61519726 Earth years

      Earth:   orbital period 1.0        Earth years, 
        365.25 Earth days, or 31557600 seconds

      Mars:    orbital period 1.8808158  Earth years
      Jupiter: orbital period 11.862615  Earth years
      Saturn:  orbital period 29.447498  Earth years
      Uranus:  orbital period 84.016846  Earth years
      Neptune: orbital period 164.79132  Earth years
-}

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

yearFromOrbPeriod :: Float -> Float -> Float
yearFromOrbPeriod seconds ratio = seconds / (31557600.0 * ratio) 

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = yearFromOrbPeriod seconds 0.2408467
ageOn Venus   seconds = yearFromOrbPeriod seconds 0.61519726
ageOn Earth   seconds = yearFromOrbPeriod seconds 1.0
ageOn Mars    seconds = yearFromOrbPeriod seconds 1.8808158
ageOn Jupiter seconds = yearFromOrbPeriod seconds 11.862615
ageOn Saturn  seconds = yearFromOrbPeriod seconds 29.447498
ageOn Uranus  seconds = yearFromOrbPeriod seconds 84.016846
ageOn Neptune seconds = yearFromOrbPeriod seconds 164.79132

-- Alternative approach using a case statement to check for the planet,
-- rather than using pattern matching. This also has the added benefit
-- of being able to use a where clause to define yearFromOrbitalPeriod,
-- as it's a single function. This creates less helper functions.

ageOnCase :: Planet -> Float -> Float
ageOnCase planet seconds = yearFromOrbitalPeriod seconds (case planet of 
  Mercury ->  0.2408467
  Venus   ->  0.61519726
  Earth   ->  1.0
  Mars    ->  1.8808158
  Jupiter ->  11.862615
  Saturn  ->  29.447498
  Uranus  ->  84.016846
  Neptune ->  164.79132)

  where yearFromOrbitalPeriod seconds period = 
          seconds / (31557600.0 * period) 