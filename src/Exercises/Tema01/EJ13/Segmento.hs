module Exercises.Tema01.EJ13.Segmento where

segmento :: Int -> Int -> [a] -> [a]
segmento a b = case (a < 0, b < 0) of
  (True, True) -> \_ -> []
  (False, True) -> \_ -> []
  (True, False) -> take b . drop a
  (False, False) -> take (b - a) . drop a

-- >>> segmento'  2 10 "hostiaputa"
-- "stiaputa"
