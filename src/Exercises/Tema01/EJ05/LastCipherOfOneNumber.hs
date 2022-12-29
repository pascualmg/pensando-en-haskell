module Exercises.Tema01.EJ05.LastCipherOfOneNumber where

lastcipher :: Int -> Int
lastcipher = (\string -> read string :: Int) . (:[]) . last . show

lastcipher' :: Int -> Int
lastcipher' = read . (:[]) . last . show
       
lastcipher'' :: Int -> Int
lastcipher'' = mod 10




