#!/usr/bin/env stack
-- stack --resolver lts-19.15 script
-- package system.random



{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}


randomString :: Int -> IO String
randomString n = replicate n $ randomRIO ('a', 'z')

main :: IO ()
main = do
  s <- randomString 10
  putStrLn s
