module Exercises.Tema01.EJ12.Segmento where


segmento :: Int -> Int -> [a] -> [a]
segmento a b xs =  take a xs


-- >>> segmento 2 5 [1..100]
