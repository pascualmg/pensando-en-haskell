-- La disyunción excluyente xor de dos fórmulas se verifica si una es verdadera y la otra es falsa.
-- Ejercicio 1.7.1. Definir la función xor1 que calcule la disyunción excluyente a partir de la tabla
-- de verdad. Usar 4 ecuaciones, una por cada línea de la tabla.

module Exercises.Tema01.EJ07.MiXor (xor1, xor2, xor3, xor4) where

    xor1 :: Bool -> Bool -> Bool
    xor1 True True = False
    xor1 True False = True
    xor1 False True = True
    xor1 False False = False


    xor2 :: Bool -> Bool -> Bool
    xor2 a b  = (a || b)  && not (a && b)

    xor3 :: Bool -> Bool -> Bool
    xor3 True b = not b
    xor3 False y  = y


    --xD po eso.
    xor4 :: Bool -> Bool -> Bool
    xor4 a b = a /= b

-- >>> xor4 False True
-- True
-- False
