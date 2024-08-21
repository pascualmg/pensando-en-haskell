module Exercises.Tema01.EJ08.RotaLista where

rota1 :: [a] -> [a]
rota1 xs = drop 1 xs ++ [head xs]


-- >>> ro
-- Variable not in scope: ro
