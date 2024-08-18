-- | Ejercicio 1.4.1. Definir la función areaDeCoronaCircular tal que (areaDeCoronaCircular r1 r2)
-- es el área de una corona circular de radio interior r1 y radio exterior r2. Por ejemplo,
-- areaDeCoronaCircular 1 2 == 9.42477796076938
-- areaDeCoronaCircular 2 5 == 65.97344572538566
-- areaDeCoronaCircular 3 5 == 50.26548245743669
module Exercises.Tema01.EJ04.CircularCrownArea where

circularCrownArea :: Double -> Double -> Double
circularCrownArea r1 r2 = pi * (r2^(2 :: Integer) - r1^(2 :: Integer))
