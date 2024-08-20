#!/usr/bin/env stack
-- stack --resolver nightly-2024-08-17 script
-- stack --compiler ghc-9.8.2 script
-- stack --package http-conduit
-- stack --package aeson


{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple



main :: IO ()
main = do
    response <- httpLBS "https://pascualmg.dev/post"

    putStrLn $ "The status code was: " ++ show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    L8.putStrLn $ getResponseBody response
