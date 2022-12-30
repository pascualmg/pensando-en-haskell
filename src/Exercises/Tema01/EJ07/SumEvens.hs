module Exercises.Tema01.EJ07.SumEvens where
    sumEvens :: [Int] -> Int
    sumEvens xs = sum [x | x <- xs, even x]

    evenOrZero :: Integral a => a -> a
    evenOrZero x = if even x then x else 0

    sumEvens' :: Integral a => [a] -> a
    sumEvens' [] = 0
    sumEvens' [x] = evenOrZero x
    sumEvens' (x:xs) = sumEvens' xs + evenOrZero x         
