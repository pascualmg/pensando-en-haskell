{-# LANGUAGE OverloadedStrings #-}

module Exercises.LearnYouAHaskell.ListComprehesions where
import Database.PostgreSQL.Simple
import Control.Monad
import Control.Applicative

main :: IO ()
main = do
  conn <- connect defaultConnectInfo {
    connectDatabase = "aftersales",
    connectUser = "postgres",
    connectPassword = "password",
    connectPort = 7490
  }

  putStrLn "2 + 2"
  -- read the varchar value from the database
  -- and convert it to an integer
  
  -- 2 + 2
  mapM_ print =<< ( query_ conn "select original_series from billing_series"  :: IO [Only Int] ) 
