module Exercises.Tema01.EJ06.BiggerOfTrhee where
  
  biggerOfTrhee :: Int -> Int -> Int -> Int
  biggerOfTrhee a b c = maximum [a, b, c]
   

  biggerOfTrhee' :: Int -> Int -> Int -> Int
  biggerOfTrhee' a b c = foldl1 max [a, b, c]