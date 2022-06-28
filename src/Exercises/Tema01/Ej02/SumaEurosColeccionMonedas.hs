-- | 1.2. Suma de euros de una colección de monedas
-- Ejercicio 1.2.1. Definir la función sumaMonedas tal que (sumaMonedas a b c d e) es la
-- suma de los euros correspondientes a a monedas de 1 euro, b de 2 euros, c de 5 euros, d 10 euros
-- y e de 20 euros. Por ejemplo,
-- sumaMonedas 0 0 0 0 1 == 20
-- sumaMonedas 0 0 8 0 3 == 100
-- sumaMonedas 1 1 1 1 1 == 38
-- Solución:
-- sumaMonedas a b c d e = 1*a+2*b+5*c+10*d+20*e

module Exercises.Tema01.Ej02.SumaEurosColeccionMonedas where
 sumaMonedas :: Int -> Int -> Int -> Int -> Int -> Int 
 sumaMonedas a b c d e  = 
   let peso = [1, 2, 5 , 10, 20] in
     (a * head peso) + 
     (b * peso!!1) +
     (c * peso!!2) +
     (d * peso!!3) +
     (e * peso!!4) 
     
 sumaMonedas' :: Int -> Int -> Int -> Int -> Int -> Int 
 sumaMonedas' a b c d e  = 
     let 
      peso = [1, 2, 5 , 10, 20] 
      monedas = [a , b , c , d , e]
     in sum (zipWith (*) monedas peso)
