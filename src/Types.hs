module Types where

data Motorcycle = Motorcycle
  { id          :: Int
  , model       :: String
  , year        :: Int
  , manufacturer:: String
  } deriving (Show, Eq)
