{-# LANGUAGE OverloadedStrings #-}

module Main where

import ADNCalculator (countADN, isValid)
import Control.Monad (forM_)
import Exercises.Tema01.Ej01.MediaDeTresNumeros (media3)
import Network.HTTP.Simple

main :: IO ()
main = do
  print $ isValid "ADN"
  print $ countADN "GATTACAGATTACAGATTTTACCCAAAAA"
  forM_
    [ "GATTACCCCCCAGGGG"
    , "AAAAATTTTTCCCCCGGGGG"
    , "ACGTACGTACGT"
    ]
    ( \adn -> do
        let counted = countADN adn
        putStrLn $ "Original: " ++ adn
        putStrLn $ "Counted: " ++ show counted
        putStrLn $ "Reconstructed: " ++ pinta counted
        putStrLn "we"
    )
    mapM_
    print
    [ media3 2 3 1
    , media3 10 20 30
    , media3 (-5) 0 5
    ]

pinta :: [(Char, Int)] -> String
pinta [] = ""
pinta ((c, i) : xs) = replicate i c ++ pinta xs

-- >>> pinta $ countADN "GATTACCCCCCAGGGG"
-- "AAATTCCCCCCGGGGG"

-- >>> pinta [('A',5),('C',5),('G',57)]
-- "AAAAACCCCCGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"

-- >>> media3 2 3 1
-- 2.0
