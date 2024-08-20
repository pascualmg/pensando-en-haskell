-- La disyunción excluyente xor de dos fórmulas se verifica si una es verdadera y la otra es falsa.
-- Ejercicio 1.7.1. Definir la función xor1 que calcule la disyunción excluyente a partir de la tabla
-- de verdad. Usar 4 ecuaciones, una por cada línea de la tabla.

module Exercises.Tema01.EJ07.MiXor where

    xor1 :: Bool -> Bool -> Bool
    xor1 True True = False
    xor1 True False = True
    xor1 False True = True
    xor1 False False = False

    xor2 :: Bool -> Bool -> Bool
    xor2 a b  = (a || b)  && not (a && b)



-- >>> xor1 True False
-- True
