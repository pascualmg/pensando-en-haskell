module PatternMatching where
  -- | la sintaxis puede ser de dos tipos ,

f :: Int -> Int
f x = case x of
  0 -> 0
  _ -> x + 1

not'::  Bool -> Bool
not' True = False
not' False = True

isZero :: Int -> Bool
isZero 0 = True
isZero _ = False

eval :: Int -> Char -> Int -> Int
eval x '+' y = x + y
eval x '*' y = x * y
eval x '-' y = x - y
eval x '/' y = x `div` y
eval x '^' y = x ^ y
eval x '%' y = x `mod` y
eval _ _ _ = 0
  


