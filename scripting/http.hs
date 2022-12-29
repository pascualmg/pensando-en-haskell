#!/usr/bin/env stack
-- stack --resolver lts-19.15 script
--package http-conduit
--package aeson


{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple


main :: IO ()
main = do
    response <- httpLBS "http://localhost:7480/work-order/filter?training=UNKNOWN&status=WaitingArticleReception"

    putStrLn $ "The status code was: " ++ show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    L8.putStrLn $ getResponseBody response
