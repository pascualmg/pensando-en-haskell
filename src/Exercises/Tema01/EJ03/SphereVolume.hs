-- | Volumen de la esfera
     --Ejercicio 1.3.1. Definir la función volumenEsfera tal que (volumenEsfera r) es el volumen
     --de la esfera de radio r. Por ejemplo,
     --volumenEsfera 10 == 4188.790204786391
module Exercises.Tema01.EJ03.SphereVolume where
  sphereVolume :: Double -> Double
  sphereVolume r = (4.0/3.0) * pi * r^3
