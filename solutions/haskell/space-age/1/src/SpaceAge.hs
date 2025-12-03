module SpaceAge (Planet(..), ageOn) where

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