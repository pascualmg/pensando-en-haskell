{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module API where

import Servant
import Types (Motorcycle)

type MotorcycleAPI = "motorcycles" :> Get '[JSON] [Motorcycle]

motorcycleServer :: Server MotorcycleAPI
motorcycleServer = return []
