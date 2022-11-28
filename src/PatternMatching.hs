module PatternMatching where

  -- | la sintaxis puede ser de dos tipos , usando el case of , o repitiendo el nombre de la func 
  -- | y haciendo uso del patternMatching

-- | con case of
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

-- | repitiendo el nombre de la func y haciendo uso del patternMatching
eval :: Int -> Char -> Int -> Int
eval a '+' b = a + b
eval x '*' y = x * y
eval x '-' y = x - y
eval x '/' y = x `div` y
eval x '^' y = x ^ y
eval x '%' y = x `mod` y
eval _ _ _ = 0

-- | usando case of y patternMatching , sugar syntax
eval':: Int -> Char -> Int -> Int
eval' a op b = case op of
  '+' -> a + b
  '*' -> a * b
  '-' -> a - b
  '/' -> a `div` b
  '^' -> a ^ b
  '%' -> a `mod` b
  _ -> 0
