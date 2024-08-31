module Udemy.MiMap where

mimap :: (a -> b) -> [a] -> [b]
mimap _ [] = []
mimap f (x:xs) =  f x : mimap f xs
