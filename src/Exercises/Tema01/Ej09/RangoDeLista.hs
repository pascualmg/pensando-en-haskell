module Exercises.Tema01.Ej09.RangoDeLista where

import Data.List ()

rango :: (Ord a) => [a] -> [a]
rango xs = [minimum xs, maximum xs]

rango' :: (Foldable t, Ord a) =>        a -> [t a -> a]
rango' xs = [foldl min xs, foldl max xs]

-- >>> rango' "osstia"
-- No instance for `Show ([String] -> String)'
--   arising from a use of `evalPrint'
--   (maybe you haven't applied a function to enough arguments?)
-- In a stmt of an interactive GHCi command: evalPrint it_abYz
