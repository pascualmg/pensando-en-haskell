module Main where

import ADNCalculator
import GoodNames

main :: IO ()
main = do
  print goodNames
  print $ isValid "ADN"
