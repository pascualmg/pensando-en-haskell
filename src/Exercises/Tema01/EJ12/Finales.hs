module Exercises.Tema01.EJ12.Finales where

---------------------------------------------------------------------------------------------------------------------------------------------
-- 1.12. Finales de una lista                                                                                                              --
-- Ejercicio 1.12.1. Definir la función finales tal que (finales n xs) es la lista formada por los n finales elementos de xs. Por ejemplo, --
--     finales 3 [2,5,4,7,9,6]  ==  [7,9,6]                                                                                                --
---------------------------------------------------------------------------------------------------------------------------------------------
finales :: Int -> [a] -> [a]
finales n xs = drop (length xs - n) xs

finales' :: Int -> [a] -> [a]
finales' _ [] = []
finales' 0 xs = xs
finales' n (_:xs) = [] ++ finales' (n-1) xs

-- >>> finales 3 [2,2,3,3,4,5,5]
-- [4,5,5]
