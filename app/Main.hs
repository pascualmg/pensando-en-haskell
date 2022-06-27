module Main where

import ADNCalculator

-- | Aqui tiene que generar documentacion automaticamente con stack haddock
main :: IO ()
main = do
  print $ isValid "ADN"
  print $ countADN "GATTACAGATTACAGATTTTACCCAAAAA"
