module Exercises.Tema01.EJ08.RotaLista where

rota1 :: [a] -> [a]
rota1 xs = drop 1 xs ++ [head xs]


rota2 :: Int -> [a]  -> [a]
rota2 n xs = drop n xs ++ take n xs




-- >>> rota2 3 "aaabbb"
-- "bbbaaa"
