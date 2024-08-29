{-# LANGUAGE OverloadedStrings #-}

module Main where

import ADNCalculator (countADN, isValid)

main :: IO ()
main = do
  print $ isValid "ADN"
  print $ countADN "GATTACAGATTACAGATTTTACCCAAAAA"


pinta :: [(Char, Int)] -> String
pinta [] = ""
pinta ((c, i) : xs) = replicate i c ++ pinta xs

-- >>> pinta $ countADN "GATTACCCCCCAGGGG"
-- "AAATTCCCCCCGGGGG"
