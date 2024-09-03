---------------------------------------------------------------------------------------------------
-- 1.11. Elementos interiores de una lista                                                       --
-- Ejercicio 1.11.1. Definir la función interior tal que (interior xs) es la lista obtenida eli- --
-- minando los extremos de la lista xs. Por ejemplo,                                             --
-- interior [2,5,3,7,3] == [5,3,7]                                                               --
-- interior [2..7] == [3,4,5,6]                                                                  --
-- Solución:                                                                                     --
-- interior xs = tail (init xs)                                                                  --
---------------------------------------------------------------------------------------------------
module Exercises.Tema01.Ej11.InteriorLista where

interior :: [a] -> [a]
interior [] = []
interior [_] = []
interior [_,_] = []
interior xs = drop 1 $ init xs

-- >>> interior [1..23]
